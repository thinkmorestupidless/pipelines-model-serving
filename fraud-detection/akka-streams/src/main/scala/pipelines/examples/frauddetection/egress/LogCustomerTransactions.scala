package pipelines.examples.frauddetection.egress

import akka.NotUsed
import akka.stream.ClosedShape
import akka.stream.scaladsl.{ GraphDSL, Merge, RunnableGraph, Sink }
import pipelines.akkastream.scaladsl.{ FlowWithPipelinesContext, RunnableGraphStreamletLogic }
import pipelines.akkastream.{ AkkaStreamlet, PipelinesContext, StreamletLogic }
import pipelines.examples.frauddetection.data.{ CustomerTransaction, ScoredTransaction }
import pipelines.examples.frauddetection.utils.InfluxDbSupport
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroInlet

/**
 * Logs all Transactions at the end of our stream
 */
class LogCustomerTransactions extends AkkaStreamlet
  with InfluxDbSupport {
  import InfluxDbSupport._

  final override def configParameters = Vector(InfluxDBActive, InfluxDBHost, InfluxDBPort)

  //\\//\\//\\ INLETS //\\//\\//\\
  val fromTheModel = AvroInlet[ScoredTransaction]("model")
  val fromTheMerchant = AvroInlet[CustomerTransaction]("merchant")

  //\\//\\//\\ OUTLETS //\\//\\//\\

  //\\//\\//\\ SHAPE //\\//\\//\\
  final override val shape = StreamletShape.withInlets(fromTheModel, fromTheMerchant)

  //\\//\\//\\ LOGIC //\\//\\//\\
  final override def createLogic(): StreamletLogic = new RunnableGraphStreamletLogic() {
    val influxDb = connect(streamletConfig)

    val theModelFlow = FlowWithPipelinesContext[ScoredTransaction].map { stx ⇒
      influxDb.writeEnd(stx.inputRecord.transactionId, stx.modelResultMetadata.modelName, stx.modelResult.value)

      if (stx.modelResult.value > 0.7) {
        system.log.info(s"${stx.inputRecord.transactionId} ********************* FRAUD *********************")
      } else {
        system.log.info(s"${stx.inputRecord.transactionId} Ok")
      }

      stx.inputRecord
    }

    val theMerchantFlow = FlowWithPipelinesContext[CustomerTransaction].map { tx ⇒
      system.log.info(s"${tx.transactionId} Ok")
      tx
    }

    def runnableGraph() =
      RunnableGraph.fromGraph(GraphDSL.create() { implicit builder: GraphDSL.Builder[NotUsed] ⇒
        import GraphDSL.Implicits._

        val model = atLeastOnceSource(fromTheModel).via(theModelFlow)
        val merchant = atLeastOnceSource(fromTheMerchant).via(theMerchantFlow)
        val out = Sink.ignore

        val merge = builder.add(Merge[(CustomerTransaction, PipelinesContext)](2))

        model ~> merge ~> out
        merchant ~> merge

        ClosedShape
      })
  }
}

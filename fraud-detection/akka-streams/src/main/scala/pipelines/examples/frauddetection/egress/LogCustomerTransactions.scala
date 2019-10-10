package pipelines.examples.frauddetection.egress

import akka.NotUsed
import akka.stream.ClosedShape
import akka.stream.scaladsl.{ GraphDSL, Merge, RunnableGraph, Sink }
import pipelines.akkastream.scaladsl.{ FlowWithPipelinesContext, RunnableGraphStreamletLogic }
import pipelines.akkastream.{ AkkaStreamlet, PipelinesContext, StreamletLogic }
import pipelines.examples.frauddetection.data.{ CustomerTransaction, ScoredTransaction }
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroInlet

class LogCustomerTransactions extends AkkaStreamlet {

  val fromTheModel = AvroInlet[ScoredTransaction]("model")
  val fromTheMerchant = AvroInlet[CustomerTransaction]("merchant")

  val shape = StreamletShape.withInlets(fromTheModel, fromTheMerchant)

  override protected def createLogic(): StreamletLogic = new RunnableGraphStreamletLogic() {

    val theModelFlow = FlowWithPipelinesContext[ScoredTransaction].map { tx ⇒
      if (tx.modelResult.value > 0.7) {
        system.log.info(s"Transaction ${tx.inputRecord.transactionId} is FRAUDULENT!!!!!")
      } else {
        system.log.info(s"Transaction ${tx.inputRecord.transactionId} => Approved By THE MODEL™")
      }

      tx.inputRecord
    }

    val theMerchantFlow = FlowWithPipelinesContext[CustomerTransaction].map { tx ⇒
      system.log.info(s"Transaction ${tx.transactionId} => Automatically Approved")
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

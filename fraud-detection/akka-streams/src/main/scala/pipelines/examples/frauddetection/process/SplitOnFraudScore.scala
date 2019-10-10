package pipelines.examples.frauddetection.process

import pipelines.examples.frauddetection.utils.InfluxDbSupport
import pipelines.akkastream.scaladsl.FlowWithPipelinesContext
import pipelines.akkastream.util.scaladsl.SplitterLogic
import pipelines.akkastream.{ AkkaStreamlet, StreamletLogic }
import pipelines.examples.frauddetection.data.ScoredTransaction
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.{ AvroInlet, AvroOutlet }

class SplitOnFraudScore extends AkkaStreamlet with InfluxDbSupport {
  import InfluxDbSupport._

  val everythingComesInHere = AvroInlet[ScoredTransaction]("in")
  val fraudulentTransactionsGoLeft = AvroOutlet[ScoredTransaction]("fraud")
  val everythingElseGoesRight = AvroOutlet[ScoredTransaction]("not-fraud")

  val shape = StreamletShape.withInlets(everythingComesInHere).withOutlets(fraudulentTransactionsGoLeft, everythingElseGoesRight)

  override protected def createLogic(): StreamletLogic = new SplitterLogic(everythingComesInHere, fraudulentTransactionsGoLeft, everythingElseGoesRight) {
    val influxDb = connect(streamletConfig)

    override def flow =
      FlowWithPipelinesContext[ScoredTransaction]
        /*.map { stx ⇒
          influxDb.writeEnd(stx.inputRecord.transactionId, stx.modelResultMetadata.modelName, stx.modelResult.value)
          stx
        }*/ .map { stx ⇒
          system.log.info(s"fraud score == ${stx.modelResult.value}")
          //          if (stx.modelResult.value > 0.5) Left(stx) else Right(stx)
          Right(stx)
        }
  }

  override def configParameters = Vector(InfluxDBActive, InfluxDBHost, InfluxDBPort)
}

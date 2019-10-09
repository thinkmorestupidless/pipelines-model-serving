package pipelines.examples.frauddetection.process

import pipelines.akkastream.util.scaladsl.MergeLogic
import pipelines.akkastream.{ AkkaStreamlet, StreamletLogic }
import pipelines.examples.frauddetection.data.CustomerTransaction
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.{ AvroInlet, AvroOutlet }

class MergeTransactions extends AkkaStreamlet {

  val fromTheLeft = AvroInlet[CustomerTransaction]("left")
  val fromTheRight = AvroInlet[CustomerTransaction]("right")
  val everythingGoesOutHere = AvroOutlet[CustomerTransaction]("transactions")

  val shape = StreamletShape.withInlets(fromTheLeft, fromTheRight).withOutlets(everythingGoesOutHere)

  override protected def createLogic(): StreamletLogic =
    new MergeLogic[CustomerTransaction](Vector(fromTheLeft, fromTheRight), everythingGoesOutHere)
}

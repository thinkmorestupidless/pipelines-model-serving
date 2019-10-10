package pipelines.examples.frauddetection.process

import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.FlowWithPipelinesContext
import pipelines.akkastream.util.scaladsl.SplitterLogic
import pipelines.examples.frauddetection.data.CustomerTransaction
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.{ AvroInlet, AvroOutlet }

import scala.util.Random

class SplitOnApprovedMerchant extends AkkaStreamlet {

  val everythingComesInHere = AvroInlet[CustomerTransaction]("in")

  val authorisedTransactionsGoLeft = AvroOutlet[CustomerTransaction]("yes")
  val everythingElseGoesRight = AvroOutlet[CustomerTransaction]("no")

  val shape = StreamletShape.withInlets(everythingComesInHere).withOutlets(authorisedTransactionsGoLeft, everythingElseGoesRight)

  def isApprovedMerchant(tx: CustomerTransaction) =
    Random.nextInt(100) > 93

  override protected def createLogic() =
    new SplitterLogic(everythingComesInHere, authorisedTransactionsGoLeft, everythingElseGoesRight) {
      override def flow =
        FlowWithPipelinesContext[CustomerTransaction]
          .map { tx ⇒
            if (isApprovedMerchant(tx)) Left(tx) else Right(tx)
          }
  }
}

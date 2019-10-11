package pipelines.examples.frauddetection.process

import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.FlowWithPipelinesContext
import pipelines.akkastream.util.scaladsl.SplitterLogic
import pipelines.examples.frauddetection.data.CustomerTransaction
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.{ AvroInlet, AvroOutlet }

import scala.util.Random

class SplitOnApprovedMerchant extends AkkaStreamlet {

  //\\//\\//\\ INLETS //\\//\\//\\
  val everythingComesInHere = AvroInlet[CustomerTransaction]("in")

  //\\//\\//\\ OUTLETS //\\//\\//\\
  val authorisedTransactionsGoLeft = AvroOutlet[CustomerTransaction]("yes")
  val everythingElseGoesRight = AvroOutlet[CustomerTransaction]("no")

  //\\//\\//\\ SHAPE //\\//\\//\\
  final override val shape = StreamletShape.withInlets(everythingComesInHere).withOutlets(authorisedTransactionsGoLeft, everythingElseGoesRight)

  //\\//\\//\\ LOGIC //\\//\\//\\
  final override def createLogic() =
    new SplitterLogic(everythingComesInHere, authorisedTransactionsGoLeft, everythingElseGoesRight) {

      def isApprovedMerchant(tx: CustomerTransaction) =
        Random.nextInt(100) > 93

      override def flow =
        FlowWithPipelinesContext[CustomerTransaction]
          .map { tx ⇒
            if (isApprovedMerchant(tx)) Left(tx) else Right(tx)
          }
    }
}

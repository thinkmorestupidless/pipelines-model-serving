package pipelines.examples.frauddetection.egress

import akka.stream.scaladsl.{ RunnableGraph, Sink }
import pipelines.akkastream.scaladsl.{ FlowWithPipelinesContext, RunnableGraphStreamletLogic }
import pipelines.akkastream.{ AkkaStreamlet, StreamletLogic }
import pipelines.examples.frauddetection.data.{ CustomerTransaction, ScoredTransaction }
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroInlet

class LogCustomerTransactions extends AkkaStreamlet {

  val fromTheModel = AvroInlet[ScoredTransaction]("model")
  val fromTheMerchant = AvroInlet[CustomerTransaction]("merchant")

  val shape = StreamletShape.withInlets(fromTheModel, fromTheMerchant)

  override protected def createLogic(): StreamletLogic = new RunnableGraphStreamletLogic() {

    val theModelFlow = FlowWithPipelinesContext[ScoredTransaction].map { tx ⇒
      system.log.info(s"Transaction ${tx.inputRecord.transactionId} => Approved By THE MODEL™")
    }

    val theMerchantFlow = FlowWithPipelinesContext[CustomerTransaction].map { tx ⇒
      system.log.info(s"Transaction ${tx.transactionId} => Automatically Approved")
    }

    override def runnableGraph(): RunnableGraph[_] =
      atLeastOnceSource(fromTheModel).via(theModelFlow).to(Sink.ignore)
    atLeastOnceSource(fromTheMerchant).via(theMerchantFlow).to(Sink.ignore)
  }
}

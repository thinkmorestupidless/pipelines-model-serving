package pipelines.examples.frauddetection.egress

import akka.stream.scaladsl.{ RunnableGraph, Sink }
import pipelines.akkastream.scaladsl.{ FlowWithPipelinesContext, RunnableGraphStreamletLogic }
import pipelines.akkastream.{ AkkaStreamlet, StreamletLogic }
import pipelines.examples.frauddetection.data.CustomerTransaction
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroInlet

class LogCustomerTransactions extends AkkaStreamlet {

  val in = AvroInlet[CustomerTransaction]("transactions")

  val shape = StreamletShape(in)

  override protected def createLogic(): StreamletLogic = new RunnableGraphStreamletLogic() {

    val flow = FlowWithPipelinesContext[CustomerTransaction].map { tx ⇒
      system.log.info(s"Transaction ${tx.transactionId} => Automatically Approved")
    }

    override def runnableGraph(): RunnableGraph[_] =
      atLeastOnceSource(in).via(flow).to(Sink.ignore)
  }
}

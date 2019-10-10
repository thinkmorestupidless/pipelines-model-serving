package pipelines.examples.frauddetection.egress

import akka.stream.scaladsl.{ RunnableGraph, Sink }
import pipelines.akkastream.scaladsl.{ FlowWithPipelinesContext, RunnableGraphStreamletLogic }
import pipelines.akkastream.{ AkkaStreamlet, StreamletLogic }
import pipelines.examples.frauddetection.data.ScoredTransaction
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroInlet

class LogScoredTransactions extends AkkaStreamlet {

  val in = AvroInlet[ScoredTransaction]("in")

  val shape = StreamletShape(in)

  override protected def createLogic(): StreamletLogic = new RunnableGraphStreamletLogic() {

    val flow = FlowWithPipelinesContext[ScoredTransaction].map { tx ⇒
      system.log.info(s"Transaction ${tx.inputRecord.transactionId} => ${tx.modelResult.value}")
    }

    override def runnableGraph(): RunnableGraph[_] =
      atLeastOnceSource(in).via(flow).to(Sink.ignore)
  }
}

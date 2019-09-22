package pipelines.examples.modelserving.frauddetection

import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.{ FlowWithPipelinesContext, RunnableGraphStreamletLogic }
import pipelines.examples.modelserving.frauddetection.data.TxResult
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroInlet

object InvalidMetricLoggingEgress extends AkkaStreamlet {
  val inlet = AvroInlet[TxResult]("in")
  val shape = StreamletShape.withInlets(inlet)

  override def createLogic = new RunnableGraphStreamletLogic() {
    val flow = FlowWithPipelinesContext[TxResult]
      .map { tx ⇒
        system.log.info(s"Transaction: inputRecord:${tx.inputRecord}, modelResult:${tx.modelResult}, modelResultMetadata: ${tx.modelResultMetadata}")
        tx
      }

    def runnableGraph = {
      atLeastOnceSource(inlet).via(flow).to(atLeastOnceSink)
    }
  }
}

package pipelines.examples.frauddetection.egress

import akka.stream.scaladsl.{ RunnableGraph, Sink }
import pipelines.akkastream.scaladsl.FlowWithPipelinesContext
import pipelines.akkastream.scaladsl.RunnableGraphStreamletLogic
import pipelines.akkastream.{ AkkaStreamlet, StreamletLogic }
import pipelines.examples.frauddetection.data.FraudReport
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroInlet

class LogFraudReport extends AkkaStreamlet {

  val fromTheFraudReport = AvroInlet[FraudReport]("in")

  val shape = StreamletShape(fromTheFraudReport)

  override protected def createLogic(): StreamletLogic = new RunnableGraphStreamletLogic() {

    def theLogger = FlowWithPipelinesContext[FraudReport]
      .map { report ⇒
        //        system.log.info(s"$report")
        report
      }

    override def runnableGraph(): RunnableGraph[_] =
      atLeastOnceSource(fromTheFraudReport).via(theLogger).to(Sink.ignore)
  }
}

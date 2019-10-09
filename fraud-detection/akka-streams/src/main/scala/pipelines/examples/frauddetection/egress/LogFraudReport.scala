package pipelines.examples.frauddetection.egress

import akka.stream.scaladsl.{ RunnableGraph, Sink }
import pipelines.akkastream.scaladsl.FlowWithPipelinesContext
import pipelines.akkastream.scaladsl.RunnableGraphStreamletLogic
import pipelines.akkastream.{ AkkaStreamlet, StreamletLogic }
import pipelines.examples.frauddetection.data.FraudReport
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroInlet

class LogFraudReport extends AkkaStreamlet {

  val fraudReportComesInHere = AvroInlet[FraudReport]("fraud-report")

  val shape = StreamletShape(fraudReportComesInHere)

  override protected def createLogic(): StreamletLogic = new RunnableGraphStreamletLogic() {

    def flow = FlowWithPipelinesContext[FraudReport]
      .map { report ⇒
        system.log.info(s"$report")
        report
      }

    override def runnableGraph(): RunnableGraph[_] =
      atLeastOnceSource(fraudReportComesInHere).via(flow).to(Sink.ignore)
  }
}

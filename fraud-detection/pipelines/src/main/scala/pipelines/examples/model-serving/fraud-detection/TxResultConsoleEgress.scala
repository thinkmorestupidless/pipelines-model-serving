package pipelines.examples.modelserving.frauddetection

import java.util.concurrent.TimeUnit

import akka.stream.scaladsl.{ RunnableGraph, Sink }
import org.influxdb.InfluxDBFactory
import org.influxdb.dto.Point
import org.joda.time.{ DateTime, DateTimeZone }
import pipelines.examples.modelserving.frauddetection.data._
import pipelines.streamlets.{ StreamletShape, StringConfigParameter }
import pipelines.streamlets.avro.AvroInlet
import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.RunnableGraphStreamletLogic
import pipelinesx.config.ConfigUtil
import pipelinesx.config.ConfigUtil.implicits._

final case object TxResultConsoleEgress extends AkkaStreamlet {
  val in = AvroInlet[TxResult]("in")
  final override val shape = StreamletShape.withInlets(in)

  val InfluxDBHost = StringConfigParameter(
    key = "influxDBHost",
    description = ""
  )

  val InfluxDBPort = StringConfigParameter(
    key = "influxDBPort",
    description = ""
  )

  override def configParameters = Vector(InfluxDBHost, InfluxDBPort)

  override def createLogic = new RunnableGraphStreamletLogic {
    val influxDBHost = streamletConfig.getString("influxDBHost")
    val influxDBPort = streamletConfig.getString("influxDBPort")

    var influxDB = InfluxDBFactory.connect("http://" + influxDBHost + ":" + influxDBPort);
    influxDB.setDatabase("fraud_ml");

    override def runnableGraph(): RunnableGraph[_] = atLeastOnceSource(in).map(r ⇒ {
      log.info("Transaction ID: " + r.inputRecord.transactionId)

      influxDB.write(Point.measurement("transaction-ingress")
        .tag("transaction-Id", r.inputRecord.transactionId)
        .tag("ml-model", r.modelResultMetadata.modelName)
        .addField("count", 1)
        .addField("transactionId", r.inputRecord.transactionId)
        .addField("result", r.modelResult.value)
        .build());

      r
    }
    ).to(Sink.ignore)
  }
}


package pipelines.examples.frauddetection.utils

import com.typesafe.config.Config
import org.influxdb.dto.Point
import org.influxdb.{ InfluxDB, InfluxDBFactory }
import pipelines.streamlets.{ BooleanConfigParameter, StringConfigParameter }

trait InfluxDbSupport {

  val InfluxDBHost = StringConfigParameter(
    key = "influxDBHost",
    description = "",
    defaultValue = Some("localhost")
  )

  val InfluxDBPort = StringConfigParameter(
    key = "influxDBPort",
    description = "",
    defaultValue = Some("8086")
  )

  val InfluxDBActive = BooleanConfigParameter(
    key = "influxDBActive",
    description = "",
    defaultValue = Some(true)
  )
}

object InfluxDbSupport {

  def connect(streamletConfig: Config): InfluxWriter = {
    val active = streamletConfig.getBoolean("influxDBActive")

    if (active) {
      val influxDBHost = streamletConfig.getString("influxDBHost")
      val influxDBPort = streamletConfig.getString("influxDBPort")
      var influxDB = InfluxDBFactory.connect("http://" + influxDBHost + ":" + influxDBPort);
      influxDB.setDatabase("fraud_ml");

      new RealInfluxWriter(influxDB)
    } else {
      new NoopInfluxWriter
    }
  }
}

trait InfluxWriter {

  def writeStart(transactionId: String)

  def writeEnd(transactionId: String, modelName: String, value: Double)
}

class RealInfluxWriter(influxDB: InfluxDB) extends InfluxWriter {

  override def writeStart(transactionId: String) = {
    influxDB.write(Point.measurement("transaction-ingress")
      .tag("transaction-Id", transactionId)
      .addField("count", 1)
      .addField("transactionId", transactionId)
      .build());
  }

  override def writeEnd(transactionId: String, modelName: String, value: Double) = {
    influxDB.write(Point.measurement("transaction-ingress")
      .tag("transaction-Id", transactionId)
      .tag("ml-model", modelName)
      .addField("count", 1)
      .addField("transactionId", transactionId)
      .addField("result", value)
      .build());
  }
}

class NoopInfluxWriter extends InfluxWriter {

  override def writeStart(transactionId: String) = {}

  def writeEnd(transactionId: String, modelName: String, value: Double) = {}
}

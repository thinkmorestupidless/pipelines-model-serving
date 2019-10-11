package pipelines.examples.frauddetection.utils

import com.typesafe.config.Config
import org.influxdb.dto.Point
import org.influxdb.{ InfluxDB, InfluxDBFactory }
import pipelines.streamlets.{ BooleanConfigParameter, StringConfigParameter }

trait InfluxDbSupport {

  val InfluxDBHost = StringConfigParameter(
    key = "influxdb-host",
    description = "",
    defaultValue = Some("localhost")
  )

  val InfluxDBPort = StringConfigParameter(
    key = "influxdb-port",
    description = "",
    defaultValue = Some("8086")
  )

  val InfluxDBActive = BooleanConfigParameter(
    key = "influxdb-active",
    description = "",
    defaultValue = Some(true)
  )
}

object InfluxDbSupport {

  def connect(streamletConfig: Config): InfluxWriter = {
    val active = streamletConfig.getBoolean("influxdb-active")

    if (active) {
      val influxDBHost = streamletConfig.getString("influxdb-host")
      val influxDBPort = streamletConfig.getString("influxdb-port")
      val influxDB = InfluxDBFactory.connect(s"http://$influxDBHost:$influxDBPort")
      influxDB.setDatabase("fraud_ml")

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
    try {
      influxDB.write(Point.measurement("transaction-ingress")
        .tag("transaction-Id", transactionId)
        .addField("count", 1)
        .addField("transactionId", transactionId)
        .build());
    } catch {
      case e: Exception ⇒ System.out.println(s"influx writing failed => ${e.getMessage}")
    }
  }

  override def writeEnd(transactionId: String, modelName: String, value: Double) = {
    try {
      influxDB.write(Point.measurement("transaction-ingress")
        .tag("transaction-Id", transactionId)
        .tag("ml-model", modelName)
        .addField("count", 1)
        .addField("transactionId", transactionId)
        .addField("result", value)
        .build());
    } catch {
      case e: Exception ⇒ System.out.println(s"influx writing failed => ${e.getMessage}")
    }
  }
}

class NoopInfluxWriter extends InfluxWriter {

  override def writeStart(transactionId: String) = {}

  def writeEnd(transactionId: String, modelName: String, value: Double) = {}
}

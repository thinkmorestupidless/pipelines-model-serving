package pipelines.examples.modelserving.frauddetection

import java.util.UUID
import java.util.concurrent.TimeUnit

import akka.NotUsed
import akka.stream.scaladsl.Source
import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.RunnableGraphStreamletLogic
import pipelines.streamlets.avro.AvroOutlet
import pipelines.streamlets.{ StreamletShape, StringConfigParameter }
import pipelinesx.ingress.RecordsReader
import pipelinesx.config.ConfigUtil
import pipelinesx.config.ConfigUtil.implicits._
import pipelinesx.logging.{ Logger, LoggingUtil }

import scala.concurrent.duration._
import com.lightbend.modelserving.model.util.MainBase
import org.influxdb.InfluxDBFactory
import org.influxdb.dto.Point
import org.joda.time.{ DateTime, DateTimeZone }
import pipelines.examples.modelserving.frauddetection.data.TxRecord

/**
 * Reads wine records from a CSV file (which actually uses ";" as the separator),
 * parses it into a WineRecord and sends it downstream.
 */
final case object FraudRecordGenerator extends AkkaStreamlet {

  val out = AvroOutlet[TxRecord]("out")

  final override val shape = StreamletShape(out)

  val InfluxDBHost = StringConfigParameter(
    key = "influxDBHost",
    description = ""
  )

  val InfluxDBPort = StringConfigParameter(
    key = "influxDBPort",
    description = ""
  )

  override def configParameters = Vector(InfluxDBHost, InfluxDBPort)

  override final def createLogic = new RunnableGraphStreamletLogic {
    val influxDBHost = streamletConfig.getString("influxDBHost")
    val influxDBPort = streamletConfig.getString("influxDBPort")

    var influxDB = InfluxDBFactory.connect("http://" + influxDBHost + ":" + influxDBPort);
    influxDB.setDatabase("fraud_ml");

    def runnableGraph =
      FraudRecordGeneratorUtil.makeSource()
        .map(r ⇒ {
          log.info("Transaction ID: " + r.transactionId)

          influxDB.write(Point.measurement("transaction-ingress")
            .tag("transaction-Id", r.transactionId)
            .addField("count", 1)
            .addField("transactionId", r.transactionId)
            .build());
          r
        })
        .to(atMostOnceSink(out))
  }
}

object FraudRecordGeneratorUtil {

  val rootConfigKey = "fraud-detection"

  lazy val dataFrequencyMilliseconds: FiniteDuration =
    ConfigUtil.default
      .getOrElse[Int](rootConfigKey + ".data-frequency-milliseconds")(1).milliseconds

  def makeSource(
      configRoot: String         = rootConfigKey,
      frequency:  FiniteDuration = dataFrequencyMilliseconds): Source[TxRecord, NotUsed] = {
    val reader = makeRecordsReader(configRoot)
    Source.repeat(reader)
      .map(reader ⇒ reader.next()._2) // Only keep the record part of the tuple
      .throttle(1, frequency)
  }

  val defaultSeparator = ","

  def makeRecordsReader(configRoot: String = rootConfigKey): RecordsReader[TxRecord] =
    RecordsReader.fromConfiguration[TxRecord](
      configurationKeyRoot = configRoot,
      dropFirstN = 0)(parse)

  val parse: String ⇒ Either[String, TxRecord] = line ⇒ {
    val tokens = line.split(defaultSeparator)
    logger.info("the record is {" + line + "}")
    if (tokens.length < 11) {
      Left(s"Record does not have 11 fields, ${tokens.mkString(defaultSeparator)}")
    } else try {
      val dtokens = tokens.map(_.trim.toFloat)
      Right(TxRecord(
        time = DateTime.now(DateTimeZone.UTC).getMillis(),
        v1 = dtokens(1),
        v2 = dtokens(2),
        v3 = dtokens(3),
        v4 = dtokens(4),
        v5 = dtokens(5),
        v6 = dtokens(6),
        v7 = dtokens(7),
        v9 = dtokens(9),
        v10 = dtokens(10),
        v11 = dtokens(11),
        v12 = dtokens(12),
        v14 = dtokens(14),
        v16 = dtokens(16),
        v17 = dtokens(17),
        v18 = dtokens(18),
        v19 = dtokens(19),
        v21 = dtokens(21),
        amount = dtokens(29),
        transactionId = UUID.randomUUID().toString
      ))
    } catch {
      case scala.util.control.NonFatal(nf) ⇒
        Left(
          s"Failed to parse string ${tokens.mkString(defaultSeparator)}. cause: $nf")
    }
  }

  val logger: Logger = LoggingUtil.getLogger(RecordsReader.getClass)
}

/**
 * Test program for [[FraudRecordGenerator]] and [[FraudRecordGeneratorUtil]];
 * reads records and prints them. For testing purposes only.
 * At this time, Pipelines intercepts calls to sbt run and sbt runMain, so use
 * the console instead:
 * ```
 * import pipelines.examples.modelserving.winequality._
 * WineRecordIngressMain.main(Array("-n","10","-f","1000"))
 * ```
 */
object FraudRecordGeneratorMain extends MainBase[TxRecord](
  defaultCount = 10,
  defaultFrequencyMillis = FraudRecordGeneratorUtil.dataFrequencyMilliseconds) {

  override protected def makeSource(frequency: FiniteDuration): Source[TxRecord, NotUsed] =
    FraudRecordGeneratorUtil.makeSource(
      FraudRecordGeneratorUtil.rootConfigKey, frequency)
}

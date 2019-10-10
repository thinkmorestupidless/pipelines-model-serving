package pipelines.examples.frauddetection.ingress

import java.util.UUID

import akka.NotUsed
import akka.stream.scaladsl.Source
import com.lightbend.modelserving.model.util.MainBase
import org.joda.time.{ DateTime, DateTimeZone }
import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.RunnableGraphStreamletLogic
import pipelines.examples.frauddetection.data.CustomerTransaction
import pipelines.examples.frauddetection.utils.InfluxDbSupport
import pipelines.streamlets.avro.AvroOutlet
import pipelines.streamlets.{ IntegerConfigParameter, StreamletShape }
import pipelinesx.config.ConfigUtil
import pipelinesx.config.ConfigUtil.implicits._
import pipelinesx.ingress.RecordsReader
import pipelinesx.logging.{ Logger, LoggingUtil }

import scala.concurrent.duration._

/**
 * Reads wine records from a CSV file (which actually uses ";" as the separator),
 * parses it into a WineRecord and sends it downstream.
 */
final case object GenerateTransactions extends AkkaStreamlet with InfluxDbSupport {
  import InfluxDbSupport._

  val out = AvroOutlet[CustomerTransaction]("transactions")

  final override val shape = StreamletShape(out)

  val DataFrequency = IntegerConfigParameter(
    key = "data-frequency",
    description = "",
    defaultValue = Some(100)
  )

  override def configParameters = Vector(DataFrequency, InfluxDBActive, InfluxDBHost, InfluxDBPort)

  override final def createLogic = new RunnableGraphStreamletLogic {
    val dataFrequency = FiniteDuration(streamletConfig.getInt("data-frequency"), "ms")
    val influxDb = connect(streamletConfig)

    def runnableGraph =
      GenerateTransactionsUtil.makeSource(dataFrequency)
        .map(transaction ⇒ {
          influxDb.writeStart(transaction.transactionId)
          transaction
        })
        .to(atMostOnceSink(out))
  }
}

object GenerateTransactionsUtil {

  val rootConfigKey = "fraud-detection"

  lazy val dataFrequencyMilliseconds: FiniteDuration =
    ConfigUtil.default
      .getOrElse[Int](rootConfigKey + ".data-frequency-milliseconds")(1).millisecond

  def makeSource(
      frequency:  FiniteDuration = dataFrequencyMilliseconds,
      configRoot: String         = rootConfigKey): Source[CustomerTransaction, NotUsed] = {
    val reader = makeRecordsReader(configRoot)
    Source.repeat(reader)
      .map(reader ⇒ reader.next()._2) // Only keep the record part of the tuple
      .throttle(1, frequency)
  }

  val defaultSeparator = ","

  def makeRecordsReader(configRoot: String = rootConfigKey): RecordsReader[CustomerTransaction] =
    RecordsReader.fromConfiguration[CustomerTransaction](
      configurationKeyRoot = configRoot,
      dropFirstN = 1)(parse)

  val parse: String ⇒ Either[String, CustomerTransaction] = line ⇒ {
    val tokens = line.split(defaultSeparator)
    if (tokens.length < 11) {
      Left(s"Record does not have 11 fields, ${tokens.mkString(defaultSeparator)}")
    } else try {
      val dtokens = tokens.map(_.trim.toFloat)
      Right(CustomerTransaction(
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
        transactionId = UUID.randomUUID().toString,
        customerId = UUID.randomUUID().toString,
        merchantId = UUID.randomUUID().toString
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
object GenerateTransactionsMain extends MainBase[CustomerTransaction](
  defaultCount = 10,
  defaultFrequencyMillis = GenerateTransactionsUtil.dataFrequencyMilliseconds) {

  override protected def makeSource(frequency: FiniteDuration): Source[CustomerTransaction, NotUsed] =
    GenerateTransactionsUtil.makeSource(
      frequency,
      GenerateTransactionsUtil.rootConfigKey)
}

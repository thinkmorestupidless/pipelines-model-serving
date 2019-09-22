package pipelines.examples.modelserving.frauddetection

import akka.NotUsed
import akka.stream.scaladsl.Source
import pipelines.streamlets.avro.AvroOutlet
import pipelines.streamlets.StreamletShape
import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.{ RunnableGraphStreamletLogic }
import pipelinesx.config.ConfigUtil
import pipelinesx.config.ConfigUtil.implicits._
import scala.concurrent.duration._
import scala.collection.JavaConverters._
import com.lightbend.modelserving.model.{ ModelDescriptor, ModelType }
import com.lightbend.modelserving.model.util.ModelMainBase

/**
 * One at a time every two minutes, loads a PMML or TensorFlow model and
 * sends it downstream.
 */
final case object FraudModelIngress extends AkkaStreamlet {

  val out = AvroOutlet[ModelDescriptor]("out", _.modelType.toString)

  final override val shape = StreamletShape(out)

  override def createLogic = new RunnableGraphStreamletLogic() {
    def runnableGraph =
      FraudModelIngressUtil.makeSource().to(atMostOnceSink(out))
  }
}

object FraudModelIngressUtil {

  lazy val modelFrequencySeconds: FiniteDuration =
    ConfigUtil.default
      .getOrElse[Int]("fraud-detection.model-frequency-seconds")(120).seconds

  // TODO: Add this logic to ConfigUtil?.
  lazy val fraudModelsResources: Map[ModelType, Seq[String]] =
    ConfigUtil.defaultConfig
      .getObject("fraud-detection.model-sources").entrySet.asScala.foldLeft(
        Map.empty[ModelType, Seq[String]]) {
          case (map, e) ⇒
            val modelType = ModelType.valueOf(e.getKey.toUpperCase)
            val list = e.getValue.valueType.toString match {
              case "LIST"   ⇒ e.getValue.unwrapped.asInstanceOf[java.util.ArrayList[String]].toArray.map(_.toString)
              case "STRING" ⇒ Array(e.getValue.unwrapped.toString)
            }
            map + (modelType -> list)
        }

  def makeSource(
      modelsResources: Map[ModelType, Seq[String]] = fraudModelsResources,
      frequency:       FiniteDuration              = modelFrequencySeconds): Source[ModelDescriptor, NotUsed] = {
    val recordsReader = FraudModelReader(modelsResources)
    Source.repeat(recordsReader)
      .map(reader ⇒ reader.next())
      .throttle(1, frequency)
  }
}

/**
 * Test program for [[WineModelIngress]] and [[FraudModelIngressUtil]].
 * It reads models and prints their data. For testing purposes only.
 * At this time, Pipelines intercepts calls to sbt run and sbt runMain, so use
 * the console instead:
 * ```
 * import pipelines.examples.modelserving.winequality._
 * WineModelIngressMain.main(Array("-n","5","-f","1000"))
 * ```
 */
object FraudModelIngressMain extends ModelMainBase(
  defaultCount = 5,
  defaultFrequencyMillis = FraudModelIngressUtil.modelFrequencySeconds * 1000) {

  override protected def makeSource(frequency: FiniteDuration): Source[ModelDescriptor, NotUsed] =
    FraudModelIngressUtil.makeSource(
      FraudModelIngressUtil.fraudModelsResources, frequency)
}

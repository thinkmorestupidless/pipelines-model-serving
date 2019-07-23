package pipelines.examples.modelserving.recommender

import pipelines.examples.modelserving.recommender.data._
import akka.NotUsed
import akka.actor.ActorSystem
import akka.stream.ActorMaterializer
import akka.stream.scaladsl.{ Source, Sink }
import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.{ RunnableGraphStreamletLogic }
import pipelines.streamlets.avro.AvroOutlet
import pipelines.streamlets.StreamletShape
import scala.collection.mutable.ListBuffer
import scala.util.Random
import scala.concurrent.duration._
import pipelinesx.config.ConfigUtil
import pipelinesx.config.ConfigUtil.implicits._

/**
 * Ingress of data for recommendations. In this case, every second we
 * load and send downstream one record that is randomly generated.
 */
final case object RecommenderDataIngress extends AkkaStreamlet {

  val out = AvroOutlet[RecommenderRecord]("out", _.user.toString)

  final override val shape = StreamletShape.withOutlets(out)

  override final def createLogic = new RunnableGraphStreamletLogic {
    def runnableGraph =
      RecommenderDataIngressUtil.makeSource().to(atMostOnceSink(out))
  }
}

object RecommenderDataIngressUtil {

  lazy val dataFrequencyMilliseconds: FiniteDuration =
    ConfigUtil.default.getOrElse[Int]("recommender.data-frequency-milliseconds")(1).milliseconds

  def makeSource(
      frequency: FiniteDuration = dataFrequencyMilliseconds): Source[RecommenderRecord, NotUsed] = {
    Source.repeat(RecommenderRecordMaker)
      .map(maker ⇒ maker.make())
      .throttle(1, frequency)
  }

  protected lazy val generator = Random

  object RecommenderRecordMaker {
    def make(): RecommenderRecord = {
      val user = generator.nextInt(1000).toLong
      val nprods = generator.nextInt(30)
      val products = new ListBuffer[Long]()
      0 to nprods foreach { _ ⇒ products += generator.nextInt(300).toLong }
      new RecommenderRecord(user, products)
    }
  }

  /** For testing purposes. */
  def main(args: Array[String]): Unit = {
    println(s"frequency (seconds): ${dataFrequencyMilliseconds}")
    implicit val system = ActorSystem("RecommenderDataIngress-Main")
    implicit val mat = ActorMaterializer()
    val source = makeSource(dataFrequencyMilliseconds)
    source.runWith(Sink.foreach(println))
    println("Finished!")
  }
}

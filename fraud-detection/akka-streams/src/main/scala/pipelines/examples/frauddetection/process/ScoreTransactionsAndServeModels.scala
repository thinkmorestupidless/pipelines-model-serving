package pipelines.examples.frauddetection.process

import java.io.File

import akka.Done
import akka.actor.ActorSystem
import akka.pattern.ask
import akka.stream.scaladsl.Sink
import akka.util.Timeout
import com.lightbend.modelserving.model.actor.ModelServingActor
import com.lightbend.modelserving.model.persistence.ModelPersistence
import com.lightbend.modelserving.model.util.MainBase
import com.lightbend.modelserving.model.{ Model, ModelDescriptor, ModelType, MultiModelFactory }
import pipelines.examples.frauddetection.models.pmml.FraudPMMLModelFactory
import pipelines.examples.frauddetection.models.tensorflow.{ FraudTensorFlowBundledModelFactory, FraudTensorFlowModelFactory }
import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.{ FlowWithPipelinesContext, RunnableGraphStreamletLogic }
import pipelines.examples.frauddetection.data.{ CustomerTransaction, ScoreFromTheModel, ScoredTransaction }
import pipelines.examples.frauddetection.models.tensorflow.{ FraudTensorFlowBundledModelFactory, FraudTensorFlowModelFactory }
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.{ AvroInlet, AvroOutlet }

import scala.concurrent.Await
import scala.concurrent.duration._

final case object ScoreTransactionsAndServeModels extends AkkaStreamlet {

  val dataComesInHere = AvroInlet[CustomerTransaction]("data")
  val modelsComeInHere = AvroInlet[ModelDescriptor]("models")
  val scoredTransactionsComeOutHere = AvroOutlet[ScoredTransaction]("results")

  final override val shape = StreamletShape.withInlets(dataComesInHere, modelsComeInHere).withOutlets(scoredTransactionsComeOutHere)

  // Declare the volume mount: 
  //  private val persistentDataMount =
  //    VolumeMount("persistence-data-mount", "/fraud/data", ReadWriteMany)
  //  override def volumeMounts = Vector(persistentDataMount)

  val modelFactory = MultiModelFactory(
    Map(
      ModelType.PMML -> FraudPMMLModelFactory,
      ModelType.TENSORFLOW -> FraudTensorFlowModelFactory,
      ModelType.TENSORFLOWSAVED -> FraudTensorFlowBundledModelFactory))

  override final def createLogic = new RunnableGraphStreamletLogic() {

    def runnableGraph() = {
      atLeastOnceSource(modelsComeInHere).via(modelFlow).runWith(Sink.ignore)
      atLeastOnceSource(dataComesInHere).via(dataFlow).to(atLeastOnceSink(scoredTransactionsComeOutHere))
    }

    implicit val askTimeout: Timeout = Timeout(30.seconds)

    val modelPersist = ModelPersistence[CustomerTransaction, Double](
      modelName = context.streamletRef,
      modelFactory = modelFactory,
      //      baseDirPath = new File(persistentDataMount.path))
      baseDirPath = new File("./"))

    val modelserver = context.system.actorOf(
      ModelServingActor.props[CustomerTransaction, Double](
        "fraud",
        modelFactory,
        modelPersist,
        () ⇒ 0.0))

    protected def dataFlow =
      FlowWithPipelinesContext[CustomerTransaction].mapAsync(1) { record ⇒
        modelserver.ask(record).mapTo[Model.ModelReturn[Double]]
          .map { modelReturn ⇒
            val result = ScoreFromTheModel(value = modelReturn.modelOutput)
            ScoredTransaction(record, result, modelReturn.modelResultMetadata)
          }
      }

    protected def modelFlow =
      FlowWithPipelinesContext[ModelDescriptor].mapAsync(1) {
        descriptor ⇒ modelserver.ask(descriptor).mapTo[Done]
      }
  }
}

/**
 * Test program for [[FraudModelServer]]. Just loads the PMML model and uses it
 * to score one record. So, this program focuses on ensuring the logic works
 * for any model, but doesn't exercise all the available models.
 * For testing purposes, only.
 * At this time, Pipelines intercepts calls to sbt run and sbt runMain, so use
 * the console instead:
 * ```
 * import pipelines.examples.modelserving.winequality._
 * WineModelServerMain.main(Array("-n","3","-f","1000"))
 * ```
 */
object ScoreTransactionsAndServeModelsMain {
  val defaultCount = 3
  val defaultFrequencyMillis = 1000.milliseconds

  def main(args: Array[String]): Unit = {
    val (count, frequency) =
      MainBase.parseArgs(args, this.getClass.getName, defaultCount, defaultFrequencyMillis)

    implicit val system: ActorSystem = ActorSystem("ModelServing")
    implicit val askTimeout: Timeout = Timeout(30.seconds)

    val modelPersist = ModelPersistence[CustomerTransaction, Double](
      modelName = "fraud-detection",
      modelFactory = ScoreTransactionsAndServeModels.modelFactory,
      baseDirPath = new File("./persistence"))

    val modelserver = system.actorOf(
      ModelServingActor.props[CustomerTransaction, Double](
        "fraud",
        ScoreTransactionsAndServeModels.modelFactory,
        modelPersist,
        () ⇒ 0.0))

    val path = "fraud/models/winequalityDecisionTreeClassification.pmml"
    val is = this.getClass.getClassLoader.getResourceAsStream(path)
    val pmml = new Array[Byte](is.available)
    is.read(pmml)
    val descriptor = new ModelDescriptor(
      modelType = ModelType.PMML,
      modelName = "Wine Model",
      description = "winequalityDecisionTreeClassification",
      modelBytes = Some(pmml),
      modelSourceLocation = None)

    val record = CustomerTransaction(0.0.toLong, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, "", "", "")

    for (i ← 0 until count) {
      modelserver.ask(descriptor)
      Thread.sleep(100)
      val result = Await.result(modelserver.ask(record).mapTo[Model.ModelReturn[Double]], 5 seconds)
      println(s"$i: result - $result")
      Thread.sleep(frequency.length)
    }
    sys.exit(0)
  }
}

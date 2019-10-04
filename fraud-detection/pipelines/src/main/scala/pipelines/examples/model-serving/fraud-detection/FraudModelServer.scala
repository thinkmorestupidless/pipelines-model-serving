package pipelines.examples.modelserving.frauddetection

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
import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.{ FlowWithPipelinesContext, RunnableGraphStreamletLogic }
import pipelines.examples.modelserving.frauddetection.data.{ TxEnrichedRecord, TxResult }
import pipelines.examples.modelserving.frauddetection.models.pmml.{ FraudPMMLModelFactory, FraudTensorFlowModelFactory }
import pipelines.examples.modelserving.frauddetection.models.tensorflow.FraudTensorFlowBundledModelFactory
import pipelines.examples.modelserving.frauddetection.result.ModelDoubleResult
import pipelines.streamlets.avro.{ AvroInlet, AvroOutlet }
import pipelines.streamlets.{ ReadWriteMany, StreamletShape, VolumeMount }

import scala.concurrent.Await
import scala.concurrent.duration._

final case object FraudModelServer extends AkkaStreamlet {

  val in0 = AvroInlet[TxEnrichedRecord]("in-0")
  val in1 = AvroInlet[ModelDescriptor]("in-1")
  val out = AvroOutlet[TxResult]("out")
  final override val shape = StreamletShape.withInlets(in0, in1).withOutlets(out)

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

    implicit val askTimeout: Timeout = Timeout(30.seconds)

    val modelPersist = ModelPersistence[TxEnrichedRecord, Double](
      modelName = context.streamletRef,
      modelFactory = modelFactory,
      //      baseDirPath = new File(persistentDataMount.path))
      baseDirPath = new File("./"))

    val modelserver = context.system.actorOf(
      ModelServingActor.props[TxEnrichedRecord, Double](
        "fraud",
        modelFactory,
        modelPersist,
        () ⇒ 0.0))

    def runnableGraph() = {
      atLeastOnceSource(in1).via(modelFlow).runWith(Sink.ignore)
      atLeastOnceSource(in0).via(dataFlow).to(atLeastOnceSink(out))
    }

    protected def dataFlow =
      FlowWithPipelinesContext[TxEnrichedRecord].mapAsync(1) { record ⇒
        modelserver.ask(record).mapTo[Model.ModelReturn[Double]]
          .map { modelReturn ⇒
            val result = ModelDoubleResult(value = modelReturn.modelOutput)
            TxResult(record, result, modelReturn.modelResultMetadata)
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
object FraudModelServerrMain {
  val defaultCount = 3
  val defaultFrequencyMillis = 1000.milliseconds

  def main(args: Array[String]): Unit = {
    val (count, frequency) =
      MainBase.parseArgs(args, this.getClass.getName, defaultCount, defaultFrequencyMillis)

    implicit val system: ActorSystem = ActorSystem("ModelServing")
    implicit val askTimeout: Timeout = Timeout(30.seconds)

    val modelPersist = ModelPersistence[TxEnrichedRecord, Double](
      modelName = "fraud-detection",
      modelFactory = FraudModelServer.modelFactory,
      baseDirPath = new File("./persistence"))

    val modelserver = system.actorOf(
      ModelServingActor.props[TxEnrichedRecord, Double](
        "fraud",
        FraudModelServer.modelFactory,
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

    val record = TxEnrichedRecord(0.0.toLong, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, "")

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

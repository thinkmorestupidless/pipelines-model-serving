package pipelines.examples.modelserving.winequality.models.pmml

import com.lightbend.modelserving.model.{ Model, ModelDescriptor, ModelFactory, ModelType }
import com.lightbend.modelserving.model.pmml.PMMLModel
import org.jpmml.evaluator.Computable
import pipelines.examples.modelserving.winequality.data.WineRecord

import scala.collection.JavaConverters._

/**
 * PMML model implementation for wine data.
 */
class WinePMMLModel(descriptor: ModelDescriptor)
  extends PMMLModel[WineRecord, Double, Double](descriptor) {

  /** Scoring (using PMML evaluator) */
  protected def invokeModel(record: WineRecord): (String, Double) = {
    // Clear arguments (from previous run)
    arguments.clear()
    // Populate input based on record
    inputFields.asScala.foreach(field ⇒ {
      arguments.put(field.getName, field.prepare(record.get(field.getName.getValue.replaceAll(" ", "_"))))
    })

    // Calculate Output
    val result = evaluator.evaluate(arguments.asJava)

    // Prepare output
    val d = result.get(tname) match {
      case c: Computable ⇒ c.getResult.toString.toDouble
      case v: Any        ⇒ v.asInstanceOf[Double]
    }
    ("", d)
  }

  protected def makeOutRecord(
      record:    WineRecord,
      errors:    String,
      score:     Double,
      duration:  Long,
      modelName: String,
      modelType: ModelType): Double = score
}

/**
 * Factory for wine data PMML model
 */
object WinePMMLModelFactory extends ModelFactory[WineRecord, Double] {

  val modelName = "WinePMMLModel"

  def make(descriptor: ModelDescriptor): Either[String, Model[WineRecord, Double]] =
    Right(new WinePMMLModel(descriptor))
}

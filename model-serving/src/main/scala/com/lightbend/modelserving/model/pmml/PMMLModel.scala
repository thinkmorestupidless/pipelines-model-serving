package com.lightbend.modelserving.model.pmml

import java.io._
import java.util

import com.lightbend.modelserving.model.{ Model, ModelMetadata }
import org.dmg.pmml.{ FieldName, PMML }
import org.jpmml.evaluator.visitors._
import org.jpmml.evaluator._
import org.jpmml.model.PMMLUtil

import scala.collection._

/**
 * Abstract class for any PMML model processing. It has to be extended by the user
 * implement score method, based on his own model. Serializability here is required for Spark
 */
abstract class PMMLModel[RECORD, RESULT](val metadata: ModelMetadata)
  extends Model[RECORD, RESULT] with Serializable {

  var arguments: mutable.Map[FieldName, FieldValue] = _
  var pmml: PMML = _
  var evaluator: ModelEvaluator[_ <: org.dmg.pmml.Model] = _
  var inputFields: util.List[InputField] = _
  var target: TargetField = _
  var tname: FieldName = _

  setup()

  private def setup(): Unit = {
    arguments = mutable.Map[FieldName, FieldValue]()
    // Marshall PMML
    pmml = PMMLUtil.unmarshal(new ByteArrayInputStream(metadata.modelBytes))
    // Optimize model// Optimize model
    PMMLModelBase.optimize(pmml)
    // Create and verify evaluator
    evaluator = ModelEvaluatorFactory.newInstance.newModelEvaluator(pmml)
    evaluator.verify()
    // Get input/target fields
    inputFields = evaluator.getInputFields
    target = evaluator.getTargetFields.get(0)
    tname = target.getName
  }

  override def cleanup(): Unit = {}

  // TODO: Verify if these methods are actually needed, since they have only one field,
  // the metadata, which has these methods:
  // private def writeObject(output: ObjectOutputStream): Unit = {
  //   val start = System.currentTimeMillis()
  //   output.writeObject(metadata)
  //   println(s"H2O serialization in ${System.currentTimeMillis() - start} ms")
  // }

  // private def readObject(input: ObjectInputStream): Unit = {
  //   val start = System.currentTimeMillis()
  //   metadata = input.readObject().asInstanceOf[ModelMetadata]
  //   try {
  //     setup()
  //     println(s"PMML deserialization in ${System.currentTimeMillis() - start} ms")
  //   } catch {
  //     case t: Throwable ⇒
  //       throw new RuntimeException(
  //         s"PMML deserialization failed in ${System.currentTimeMillis() - start} ms", t)
  //   }
  // }
}

object PMMLModelBase {

  // List of PMML optimizers (https://groups.google.com/forum/#!topic/jpmml/rUpv8hOuS3A)
  private val optimizers = Array(new ExpressionOptimizer, new FieldOptimizer, new PredicateOptimizer, new GeneralRegressionModelOptimizer, new NaiveBayesModelOptimizer, new RegressionModelOptimizer)

  /** Optimize a PMML model */
  def optimize(pmml: PMML) = this.synchronized {
    optimizers.foreach(opt ⇒
      try {
        opt.applyTo(pmml)
      } catch {
        case t: Throwable ⇒ {
          println(s"Error optimizing model for optimizer $opt")
          t.printStackTrace()
        }
      })
  }
}

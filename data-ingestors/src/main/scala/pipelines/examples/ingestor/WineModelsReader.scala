package pipelines.examples.ingestor

import pipelines.examples.data._
import java.io.BufferedInputStream

/**
 * Provides an infinite stream of wine records, repeatedly reading them from
 * the specified resource.
 */
final case class WineModelsReader(resourceNames: Map[ModelType, Seq[String]]) {

  assert(resourceNames.size > 0)

  protected var currentModelType: ModelType = ModelType.TENSORFLOW
  protected var currentIndex = 0
  init(ModelType.TENSORFLOW)

  // ModelTypes defined in the Avro files: ["TENSORFLOW", "TENSORFLOWSAVED", "TENSORFLOWSERVING", "PMML"]
  def next(): ModelDescriptor = currentModelType match {
    case ModelType.TENSORFLOW if finished(ModelType.TENSORFLOW, currentIndex) ⇒
      init(ModelType.PMML)
      next()

    case ModelType.TENSORFLOW ⇒
      val resourceName = resourceNames(ModelType.TENSORFLOW)(currentIndex)
      val barray = readBytes(resourceName)
      currentIndex += 1
      new ModelDescriptor(
        name = s"Tensorflow Model - $resourceName",
        description = "generated from TensorFlow", modeltype = ModelType.TENSORFLOW, modeldata = Some(barray),
        modeldatalocation = None, dataType = "wine")

    case ModelType.PMML if finished(ModelType.PMML, currentIndex) ⇒
      init(ModelType.TENSORFLOW)
      next()

    case ModelType.PMML ⇒
      val resourceName = resourceNames(ModelType.PMML)(currentIndex)
      val barray = readBytes(resourceName)
      currentIndex += 1
      new ModelDescriptor(
        name = resourceName.dropRight(5),
        description = "generated from Spark", modeltype = ModelType.PMML, modeldata = Some(barray),
        modeldatalocation = None, dataType = "wine")

    case ModelType.TENSORFLOWSERVING | ModelType.TENSORFLOWSAVED ⇒
      Console.err.println(
        s"BUG! currentModelType = $currentModelType should not be set! Using TENSORFLOW")
      init(ModelType.TENSORFLOW)
      next()
  }

  protected def readBytes(source: String): Array[Byte] = try {
    val bis = new BufferedInputStream(getClass.getResourceAsStream(source))
    val barray = Stream.continually(bis.read).takeWhile(-1 !=).map(_.toByte).toArray
    bis.close()
    barray
  } catch {
    case e: java.io.IOException ⇒
      throw new IllegalArgumentException("Bad input source: " + source, e)
  }

  protected def finished(modelType: ModelType, currentIndex: Int): Boolean =
    resourceNames.get(modelType) match {
      case None                                      ⇒ true
      case Some(names) if currentIndex >= names.size ⇒ true
      case _                                         ⇒ false
    }

  protected def init(whichType: ModelType): Unit = {
    currentModelType = whichType
    currentIndex = 0
    if (finished(whichType, 0))
      println(s"WARNING: No resources specified for model type $whichType")
  }
}

object WineModelsReader {

  /** For testing purposes. */
  def main(args: Array[String]): Unit = {
    val count = if (args.length > 0) args(0).toInt else 100000

    val reader = new WineModelsReader(WineModelDataIngressUtil.wineModelsResources)
    (1 to count).foreach { n ⇒
      val model = reader.next()
      println("%7d: %s".format(n, model))
    }
  }
}

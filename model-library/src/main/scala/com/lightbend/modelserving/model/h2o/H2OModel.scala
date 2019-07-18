package com.lightbend.modelserving.model.h2o

import java.io.{ByteArrayInputStream, ByteArrayOutputStream, ObjectInputStream, ObjectOutputStream, Serializable}
import java.util.zip.ZipInputStream

import com.lightbend.modelserving.model.Model
import hex.ModelCategory
import hex.genmodel.{InMemoryMojoReaderBackend, MojoModel}
import hex.genmodel.easy.EasyPredictModelWrapper
import pipelines.examples.data.ModelType

import scala.collection.JavaConverters._

abstract class H2OModel[RECORD, RESULT](inputStream: Array[Byte]) extends Model[RECORD, RESULT] with Serializable {

  var bytes = inputStream
  var model: EasyPredictModelWrapper = _
  setup()

  private def setup(): Unit = {
    val filesMap = scala.collection.mutable.Map[String, Array[Byte]]()
    val zis = new ZipInputStream(new ByteArrayInputStream(inputStream))
    Stream.continually(zis.getNextEntry).takeWhile(_ != null).foreach { file =>
      val buffer = new Array[Byte](1024)
      val content = new ByteArrayOutputStream()
      Stream.continually(zis.read(buffer)).takeWhile(_ != -1).foreach(content.write(buffer, 0, _))
      filesMap += (file.getName -> content.toByteArray)
    }

    val backend = new InMemoryMojoReaderBackend(mapAsJavaMap(filesMap))
    model = new EasyPredictModelWrapper(MojoModel.load(backend))
    verifyModelType(model.getModelCategory) match {
      case true =>
      case false => throw new Exception("H2O unknown model type")
    }
  }

  /** Abstraction for cleaning up resources */
  override def cleanup(): Unit = {}

  /** Serialize the model to bytes */
  override def toBytes(): Array[Byte] = bytes

  /** Get the type of model. */
  override def getType = ModelType.H2O

  /** Validate model type. */
  private def verifyModelType(mc: ModelCategory): Boolean = mc match {
    case ModelCategory.Unknown => false
    case _ => true
  }

  override def equals(obj: Any): Boolean = {
    obj match {
      case h2oModel: H2OModel[RECORD, RESULT] ⇒
        h2oModel.toBytes.toList == inputStream.toList
      case _ ⇒ false
    }
  }

  private def writeObject(output: ObjectOutputStream): Unit = {
    val start = System.currentTimeMillis()
    output.writeObject(bytes)
    println(s"H2O serialization in ${System.currentTimeMillis() - start} ms")
  }

  private def readObject(input: ObjectInputStream): Unit = {
    val start = System.currentTimeMillis()
    bytes = input.readObject().asInstanceOf[Array[Byte]]
    // Marshall H2O
    try {
      setup()
      println(s"H2O deserialization in ${System.currentTimeMillis() - start} ms")
    } catch {
      case t: Throwable ⇒
        println(s"H2O deserialization failed in ${System.currentTimeMillis() - start} ms")
        println(s"Exception $t")
    }
  }
}
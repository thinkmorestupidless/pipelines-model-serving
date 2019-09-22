package pipelines.examples.modelserving.frauddetection

import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport._

import JsonTxFormat._
import pipelines.streamlets.avro._
import pipelines.streamlets._
import pipelines.akkastream._
import pipelines.akkastream.util.scaladsl.HttpServerLogic
import pipelines.examples.modelserving.frauddetection.data.TxRecord

object TxRecordIngress extends AkkaServerStreamlet {
  val out = AvroOutlet[TxRecord]("out") //, (tx: TxRecord) ⇒ tx.nameOrig + "-" + tx.nameDest)
  final override val shape = StreamletShape.withOutlets(out)

  override final def createLogic = HttpServerLogic.default(this, out)
}

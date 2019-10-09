package pipelines.examples.frauddetection.ingress

import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport._

import pipelines.akkastream.AkkaServerStreamlet
import pipelines.akkastream.util.scaladsl.HttpServerLogic
import pipelines.examples.frauddetection.data.CustomerTransaction
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroOutlet

import pipelines.examples.frauddetection.utils.CustomerTransactionProtocol._

object ReceiveTransactionsOverHttp extends AkkaServerStreamlet {

  val out = AvroOutlet[CustomerTransaction]("transactions")

  final override val shape = StreamletShape.withOutlets(out)

  override final def createLogic =
    HttpServerLogic.default(this, out)
}


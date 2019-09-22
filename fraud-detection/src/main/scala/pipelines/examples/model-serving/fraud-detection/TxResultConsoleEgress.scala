package pipelines.examples.modelserving.frauddetection

import pipelines.examples.modelserving.frauddetection.data._
import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroInlet
import pipelines.akkastream.AkkaStreamlet
import pipelinesx.egress.ConsoleEgressLogic

final case object TxResultConsoleEgress extends AkkaStreamlet {
  val in = AvroInlet[TxResult]("in")
  final override val shape = StreamletShape.withInlets(in)

  override def createLogic = ConsoleEgressLogic[TxResult](
    in = in,
    prefix = "Wine Quality: ")
}


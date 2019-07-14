package pipelines.examples.ml.egress

import pipelines.streamlets.StreamletShape
import pipelines.streamlets.avro.AvroInlet
import pipelines.akkastream.AkkaStreamlet
import pipelines.egress.LogEgressLogic
import pipelines.examples.data._

final case object RecommenderLoggerEgress extends AkkaStreamlet {
  val in = AvroInlet[RecommendationResult]("in")
  final override val shape = StreamletShape.withInlets(in)

  override def createLogic = LogEgressLogic.makeFromConfig[RecommendationResult](
    in = in,
    logLevelConfigKey = "recommender.log-egress-level",
    prefix = "Recommender:")
}

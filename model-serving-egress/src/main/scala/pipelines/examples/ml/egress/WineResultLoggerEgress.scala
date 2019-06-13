package pipelines.examples.ml.egress

import pipelines.examples.data._
import akka.event.Logging.{ LogLevel, InfoLevel }

final case class WineResultLoggerEgress(logLevel: LogLevel = InfoLevel)
  extends LogEgress[RecommendationResult](logLevel) {
  val prefix: String = "Wine Quality: "
}

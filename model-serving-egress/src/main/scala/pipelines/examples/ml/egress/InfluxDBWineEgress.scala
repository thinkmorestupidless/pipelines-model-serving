package pipelines.examples.ml.egress

import pipelines.examples.data._
import org.influxdb.dto.Point

object InfluxDBWineRecordEgress extends InfluxDBEgress[WineRecord]("wine_record") {
  val writer: InfluxDBUtil.Writer[WineRecord] = WineRecordInfluxDBWriter
}

object InfluxDBWineResultEgress extends InfluxDBEgress[WineResult]("wine_result") {
  val writer: InfluxDBUtil.Writer[WineResult] = WineResultInfluxDBWriter
}

object WineResultInfluxDBWriter extends InfluxDBUtil.Writer[WineResult] {
  def addFields(point: Point.Builder, record: WineResult): Unit = {
    point.addField("result", record.result)
    point.addField("duration", record.duration)
    point.tag("model", record.name)
  }
}

object WineRecordInfluxDBWriter extends InfluxDBUtil.Writer[WineRecord] {
  def addFields(point: Point.Builder, record: WineRecord): Unit = {
    point.addField("alcohol", record.alcohol)
    point.addField("ph", record.pH)
    point.addField("citric_acid", record.citric_acid)
  }
}

package com.lightbend.fraud.gen

import java.nio.file.Paths
import java.util.UUID

import akka.NotUsed
import akka.actor.ActorSystem
import akka.stream.alpakka.csv.scaladsl.{CsvFormatting, CsvParsing, CsvToMap}
import akka.stream.scaladsl.{FileIO, Sink, Source}
import akka.stream.{ActorMaterializer, Materializer}
import akka.util.ByteString
import org.slf4j.{Logger, LoggerFactory}

import scala.concurrent.ExecutionContext.Implicits._
import scala.concurrent.Future
import scala.util.{Failure, Random, Success}

object Main {

  val CustomerId = "CustomerId"
  val DeviceId = "DeviceId"

  val log: Logger = LoggerFactory.getLogger(getClass)

  val r = scala.util.Random

  def main(args: Array[String]): Unit = {
    log.info("starting customer generator")

    implicit val system = ActorSystem("customer-generator")
    implicit val materializer = ActorMaterializer()

    execute()
  }

  def execute()(implicit system: ActorSystem, mat: Materializer) =
    for {
      customers <- generateCustomers()
    } yield {
      log.info(s"successfully generated ${customers.size} customers")
      updateCsv(customers.toList)
    }

  def updateCsv(customers: List[Customer])(implicit system: ActorSystem, mat: Materializer) = {
    val conf = system.settings.config.getConfig("data-updater")
    val inputPathStr = conf.getString("input-file")
    val outputPathStr = conf.getString("output-file")

    // Delete the target file, if it exists, before we start
    val outputPath = Paths.get(outputPathStr)
    val outputFile = outputPath.toFile()

    if (outputFile.exists()) {
      outputFile.delete()
    }

    FileIO.fromPath(Paths.get(inputPathStr))
      .via(CsvParsing.lineScanner())
      .via(CsvToMap.toMap())
      .map(row => addRandomCustomerAndDevice(row, customers))
      .map(_.values.toList.map(_.utf8String))
      .via(CsvFormatting.format())
      .runWith(FileIO.toPath(outputPath))
      .onComplete {
        case Success(_) => log.info("All Done!")
        case Failure(e) => log.warn(s"Failed to write CSV file -> $e")
      }
  }

  def addRandomCustomerAndDevice(row: Map[String, ByteString], customers: List[Customer]): Map[String, ByteString] = {
    val customer = customers(r.nextInt(customers.size))
    val device = customer.devices(r.nextInt(customer.devices.size))
    row ++ List((CustomerId -> ByteString(customer.id.toString)), (DeviceId -> ByteString(device.id.toString)))
  }

  def generateCustomers()(implicit system: ActorSystem, mat: Materializer): Future[Seq[Customer]] = {
    val conf = system.settings.config.getConfig("customer-generator")
    val customerCount = conf.getLong("customer-count")
    val devicesPerCustomer = conf.getInt("devices-per-customer")

    Source.repeat(NotUsed)
      .take(customerCount)
      .mapAsync(10) {
        _ => generateCustomer(devicesPerCustomer)
      }.runWith(Sink.seq)
  }

  def generateCustomer(devicesPerCustomer: Int): Future[Customer] =
    Future {
      val devices: List[Device] = (1 to devicesPerCustomer).foldLeft(List[Device]()) { (d, i) => d ++ List(generateDevice()) }
      Customer(UUID.randomUUID(), devices)
    }

  def generateDevice(): Device = {
    val uuid = UUID.randomUUID()
    val trusted = Random.nextBoolean()

    Device(uuid, trusted)
  }
}

case class Customer(id: UUID, devices: List[Device])

case class Device(id: UUID, trusted: Boolean)

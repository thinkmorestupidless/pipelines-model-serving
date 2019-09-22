package com.lightbend.fraud.gen

import java.util.UUID

import akka.NotUsed
import akka.actor.ActorSystem
import akka.stream.ActorMaterializer
import akka.stream.scaladsl.{Sink, Source}
import org.slf4j.{Logger, LoggerFactory}

import scala.concurrent.ExecutionContext.Implicits._
import scala.concurrent.duration._
import scala.concurrent.{Await, Future}
import scala.util.Random

object Main {

  val log: Logger = LoggerFactory.getLogger(getClass)

  def main(args: Array[String]): Unit = {
    log.info("starting customer generator")

    implicit val system = ActorSystem("customer-generator")
    implicit val materializer = ActorMaterializer()

    val conf = system.settings.config.getConfig("customer-generator")

    val customerCount = conf.getLong("customer-count")
    val devicesPerCustomer = conf.getInt("devices-per-customer")

    val f: Future[Seq[Customer]] = Source.repeat(NotUsed)
      .take(customerCount)
      .mapAsync(10) {
        _ => generateCustomer(devicesPerCustomer)
      }.runWith(Sink.seq)
    val customers = Await.result(f, 10 seconds)

    log.info(s"successfully generated ${customers.size} customers")
  }

  def generateCustomer(devicesPerCustomer: Int): Future[Customer] =
    Future {
      val devices: Set[Device] = (1 to devicesPerCustomer).foldLeft(Set[Device]())((d, i) => d + generateDevice())
      Customer(UUID.randomUUID(), devices)
    }

  def generateDevice(): Device = {
    val uuid = UUID.randomUUID()
    val trusted = Random.nextBoolean()

    Device(uuid, trusted)
  }
}

case class Customer(id: UUID, devices: Set[Device])

case class Device(id: UUID, trusted: Boolean)

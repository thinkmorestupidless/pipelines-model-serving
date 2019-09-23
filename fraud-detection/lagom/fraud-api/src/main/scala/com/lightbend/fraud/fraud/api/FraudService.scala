package com.lightbend.fraud.fraud.api

import akka.{ Done, NotUsed }
import com.lightbend.lagom.scaladsl.api.broker.Topic
import com.lightbend.lagom.scaladsl.api.broker.kafka.{ KafkaProperties, PartitionKeyStrategy }
import com.lightbend.lagom.scaladsl.api.{ Descriptor, Service, ServiceCall }
import play.api.libs.json.{ Format, Json }

trait FraudService extends Service {

  def createCustomer(): ServiceCall[CreateCustomer, CustomerCreatedResponse]

  def addDevice(customerId: String): ServiceCall[Device, DeviceAddedResponse]

  def getDevice(customerId: String, deviceId: String): ServiceCall[NotUsed, Device]

  override final def descriptor: Descriptor = {
    import Service._
    // @formatter:off
    named("fraud")
      .withCalls(
        pathCall("/api/customers", createCustomer _),
        pathCall("/api/customers/:customerId/devices", addDevice _),
        pathCall("/api/customers/:customerId/devices/:deviceId", getDevice _))
      .withAutoAcl(true)
    // @formatter:on
  }
}

case class CreateCustomer(customerId: String)

object CreateCustomer {
  implicit val format: Format[CreateCustomer] = Json.format
}

case class CustomerCreatedResponse(customerId: String)

object CustomerCreatedResponse {
  implicit val format: Format[CustomerCreatedResponse] = Json.format
}

case class AddDevice(deviceId: String, isTrusted: Boolean)

object AddDevice {
  implicit val format: Format[AddDevice] = Json.format
}

case class Device(deviceId: String, isTrusted: Boolean)

object Device {
  implicit val format: Format[Device] = Json.format
}

case class DeviceAddedResponse(customerId: String, device: Device)

object DeviceAddedResponse {
  implicit val format: Format[DeviceAddedResponse] = Json.format
}

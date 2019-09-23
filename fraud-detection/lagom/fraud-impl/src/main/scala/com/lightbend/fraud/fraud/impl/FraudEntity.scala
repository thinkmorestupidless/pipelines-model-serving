package com.lightbend.fraud.fraud.impl

import akka.Done
import com.lightbend.lagom.scaladsl.persistence.PersistentEntity.ReplyType
import com.lightbend.lagom.scaladsl.persistence.{ AggregateEvent, AggregateEventTag, PersistentEntity }
import com.lightbend.lagom.scaladsl.playjson.{ JsonSerializer, JsonSerializerRegistry }
import play.api.libs.json.{ Format, Json }

import scala.collection.immutable.Seq

class FraudEntity extends PersistentEntity {

  override type Command = FraudCommand[_]
  override type Event = FraudEvent
  override type State = CustomerState

  /**
   * The initial state. This is used if there is no snapshotted state to be found.
   */
  override def initialState: CustomerState = CustomerState(List.empty)

  /**
   * An entity can define different behaviours for different states, so the behaviour
   * is a function of the current state to a set of actions.
   */
  override def behavior: Behavior = {
    case CustomerState(_) => Actions().onCommand[CreateCustomer, String] {

      case (CreateCustomer(_), ctx, _) =>
        ctx.thenPersist(
          CustomerCreated(entityId)) { _ =>
            ctx.reply(entityId)
          }

    }.onCommand[AddDevice, Device] {

      case (AddDevice(deviceId, isTrusted), ctx, _) =>
        ctx.thenPersist(
          DeviceAdded(entityId, deviceId, isTrusted)) { _ =>
            ctx.reply(Device(deviceId, isTrusted))
          }

    }.onReadOnlyCommand[GetDevice, Device] {

      case (GetDevice(deviceId), ctx, state) =>
        val device = state.devices.find(_.uuid == deviceId).get
        ctx.reply(device)

    }.onEvent {

      case (CustomerCreated(_), state) =>
        state

      case (DeviceAdded(_, deviceId, isTrusted), state) =>
        val newDevices = state.devices :+ Device(deviceId, isTrusted)
        state.copy(devices = newDevices)

    }
  }
}

case class CustomerState(devices: List[Device])

object CustomerState {
  implicit val format: Format[CustomerState] = Json.format
}

case class Device(uuid: String, isTrusted: Boolean)

object Device {
  implicit val format: Format[Device] = Json.format
}

/**
 * This interface defines all the events that the FraudEntity supports.
 */
sealed trait FraudEvent extends AggregateEvent[FraudEvent] {
  def aggregateTag: AggregateEventTag[FraudEvent] = FraudEvent.Tag
}

object FraudEvent {
  val Tag: AggregateEventTag[FraudEvent] = AggregateEventTag[FraudEvent]
}

case class CustomerCreated(uuid: String) extends FraudEvent

object CustomerCreated {
  implicit val format: Format[CustomerCreated] = Json.format
}

case class DeviceAdded(customerId: String, deviceId: String, trusted: Boolean) extends FraudEvent

object DeviceAdded {
  implicit val format: Format[DeviceAdded] = Json.format
}

/**
 * This interface defines all the commands that the FraudEntity supports.
 */
sealed trait FraudCommand[R] extends ReplyType[R]

case class CreateCustomer(uuid: String) extends FraudCommand[String]

object CreateCustomer {
  implicit val format: Format[CreateCustomer] = Json.format
}

case class GetDevice(deviceId: String) extends FraudCommand[Device]

object GetDevice {
  implicit val format: Format[GetDevice] = Json.format
}

case class AddDevice(uuid: String, trusted: Boolean) extends FraudCommand[Device]

object AddDevice {
  implicit val format: Format[AddDevice] = Json.format
}

/**
 * Akka serialization, used by both persistence and remoting, needs to have
 * serializers registered for every type serialized or deserialized. While it's
 * possible to use any serializer you want for Akka messages, out of the box
 * Lagom provides support for JSON, via this registry abstraction.
 *
 * The serializers are registered here, and then provided to Lagom in the
 * application loader.
 */
object FraudSerializerRegistry extends JsonSerializerRegistry {
  override def serializers: Seq[JsonSerializer[_]] = Seq(
    JsonSerializer[GetDevice],
    JsonSerializer[AddDevice],
    JsonSerializer[CustomerCreated],
    JsonSerializer[DeviceAdded],
    JsonSerializer[CustomerState])
}

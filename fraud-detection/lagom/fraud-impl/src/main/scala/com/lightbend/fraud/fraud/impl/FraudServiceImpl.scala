package com.lightbend.fraud.fraud.impl

import com.lightbend.fraud.fraud.api
import com.lightbend.fraud.fraud.api.FraudService
import com.lightbend.lagom.scaladsl.api.ServiceCall
import com.lightbend.lagom.scaladsl.persistence.PersistentEntityRegistry

import scala.concurrent.ExecutionContext.Implicits._

/**
 * Implementation of the FraudService.
 */
class FraudServiceImpl(persistentEntityRegistry: PersistentEntityRegistry) extends FraudService {

  override def createCustomer() = ServiceCall { request =>
    val ref = persistentEntityRegistry.refFor[FraudEntity](request.customerId)
    ref.ask(CreateCustomer(request.customerId))
      .map(answer => {
        api.CustomerCreatedResponse(answer)
      })
  }

  override def addDevice(customerId: String) = ServiceCall { request =>
    val ref = persistentEntityRegistry.refFor[FraudEntity](customerId)
    ref.ask(AddDevice(request.deviceId, request.isTrusted))
      .map { answer =>
        api.DeviceAddedResponse(customerId, api.Device(answer.uuid, answer.isTrusted))
      }
  }

  override def getDevice(customerId: String, deviceId: String) = ServiceCall { _ =>
    val ref = persistentEntityRegistry.refFor[FraudEntity](customerId)
    ref.ask(GetDevice(deviceId))
      .map { answer =>
        api.Device(answer.uuid, answer.isTrusted)
      }
  }
}

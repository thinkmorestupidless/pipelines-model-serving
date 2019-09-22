package com.lightbend.fraud.fraud.impl

import com.lightbend.fraud.fraud.api
import com.lightbend.fraud.fraud.api.FraudService
import com.lightbend.lagom.scaladsl.api.ServiceCall
import com.lightbend.lagom.scaladsl.api.broker.Topic
import com.lightbend.lagom.scaladsl.broker.TopicProducer
import com.lightbend.lagom.scaladsl.persistence.{ EventStreamElement, PersistentEntityRegistry }

/**
 * Implementation of the FraudService.
 */
class FraudServiceImpl(persistentEntityRegistry: PersistentEntityRegistry) extends FraudService {

  override def hello(id: String) = ServiceCall { _ =>
    // Look up the fraud entity for the given ID.
    val ref = persistentEntityRegistry.refFor[FraudEntity](id)

    // Ask the entity the Hello command.
    ref.ask(Hello(id))
  }

  override def useGreeting(id: String) = ServiceCall { request =>
    // Look up the fraud entity for the given ID.
    val ref = persistentEntityRegistry.refFor[FraudEntity](id)

    // Tell the entity to use the greeting message specified.
    ref.ask(UseGreetingMessage(request.message))
  }

  override def greetingsTopic(): Topic[api.GreetingMessageChanged] =
    TopicProducer.singleStreamWithOffset {
      fromOffset =>
        persistentEntityRegistry.eventStream(FraudEvent.Tag, fromOffset)
          .map(ev => (convertEvent(ev), ev.offset))
    }

  private def convertEvent(helloEvent: EventStreamElement[FraudEvent]): api.GreetingMessageChanged = {
    helloEvent.event match {
      case GreetingMessageChanged(msg) => api.GreetingMessageChanged(helloEvent.entityId, msg)
    }
  }
}

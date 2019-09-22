package com.lightbend.fraud.fraudstream.impl

import com.lightbend.lagom.scaladsl.api.ServiceCall
import com.lightbend.fraud.fraudstream.api.FraudStreamService
import com.lightbend.fraud.fraud.api.FraudService

import scala.concurrent.Future

/**
  * Implementation of the FraudStreamService.
  */
class FraudStreamServiceImpl(fraudService: FraudService) extends FraudStreamService {
  def stream = ServiceCall { hellos =>
    Future.successful(hellos.mapAsync(8)(fraudService.hello(_).invoke()))
  }
}

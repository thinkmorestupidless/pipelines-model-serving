package com.lightbend.fraud.fraudstream.impl

import com.lightbend.lagom.scaladsl.api.ServiceLocator.NoServiceLocator
import com.lightbend.lagom.scaladsl.server._
import com.lightbend.lagom.scaladsl.devmode.LagomDevModeComponents
import play.api.libs.ws.ahc.AhcWSComponents
import com.lightbend.fraud.fraudstream.api.FraudStreamService
import com.lightbend.fraud.fraud.api.FraudService
import com.softwaremill.macwire._

class FraudStreamLoader extends LagomApplicationLoader {

  override def load(context: LagomApplicationContext): LagomApplication =
    new FraudStreamApplication(context) {
      override def serviceLocator: NoServiceLocator.type = NoServiceLocator
    }

  override def loadDevMode(context: LagomApplicationContext): LagomApplication =
    new FraudStreamApplication(context) with LagomDevModeComponents

  override def describeService = Some(readDescriptor[FraudStreamService])
}

abstract class FraudStreamApplication(context: LagomApplicationContext)
  extends LagomApplication(context)
    with AhcWSComponents {

  // Bind the service that this server provides
  override lazy val lagomServer: LagomServer = serverFor[FraudStreamService](wire[FraudStreamServiceImpl])

  // Bind the FraudService client
  lazy val fraudService: FraudService = serviceClient.implement[FraudService]
}

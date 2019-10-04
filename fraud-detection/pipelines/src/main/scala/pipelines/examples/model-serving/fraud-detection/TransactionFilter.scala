package pipelines.examples.modelserving.frauddetection

import akka.stream.scaladsl.Flow
import pipelines.akkastream.scaladsl.RunnableGraphStreamletLogic
import pipelines.akkastream.{ AkkaStreamlet, PipelinesContext }
import pipelines.examples.modelserving.frauddetection.data.TxRecord
import pipelines.streamlets.avro.{ AvroInlet, AvroOutlet }
import pipelines.streamlets.{ StreamletShape, StringConfigParameter }

object TransactionFilter extends AkkaStreamlet {
  val in = AvroInlet[TxRecord]("in")
  val out = AvroOutlet[TxRecord]("out") //, (tx: TxRecord) ⇒ tx.nameOrig + "-" + tx.nameDest)

  val shape = StreamletShape(in).withOutlets(out)

  // TODO we can probably add a nice validation pattern?
  val FilteringResource = StringConfigParameter(
    key = "filterResource",
    description = "Provide the resource to use for transaction filtering"
  )

  override def configParameters = Vector(FilteringResource)

  override def createLogic = new RunnableGraphStreamletLogic() {

    // load filtering resource using config key
    //    val filteringResourcePath = streamletConfig.getString(FilteringResource.key)
    //    val merchantIds = AuthorizedMerchants.getMerchantIds(filteringResourcePath)

    def runnableGraph = atLeastOnceSource(in).via(flow.named("merchantfilter")).to(atLeastOnceSink(out))

    def flow = Flow[(TxRecord, PipelinesContext)]
  }
}

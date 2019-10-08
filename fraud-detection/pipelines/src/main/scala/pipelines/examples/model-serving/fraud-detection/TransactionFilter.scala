package pipelines.examples.modelserving.frauddetection

import akka.stream.scaladsl.Flow
import pipelines.akkastream.scaladsl.RunnableGraphStreamletLogic
import pipelines.akkastream.{ AkkaStreamlet, PipelinesContext }
import pipelines.examples.modelserving.frauddetection.data.{ TxEnrichedRecord, TxRecord }
import pipelines.streamlets.avro.{ AvroInlet, AvroOutlet }
import pipelines.streamlets.{ StreamletShape, StringConfigParameter }

object TransactionFilter extends AkkaStreamlet {
  val in = AvroInlet[TxRecord]("in")
  val out = AvroOutlet[TxEnrichedRecord]("out") //, (tx: TxRecord) ⇒ tx.nameOrig + "-" + tx.nameDest)

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

    def runnableGraph = atLeastOnceSource(in).via(flow.named("merchantfilter"))
      .map(e ⇒ TxEnrichedRecord(
        time = e.time,
        v1 = e.v1,
        v2 = e.v2,
        v3 = e.v3,
        v4 = e.v4,
        v5 = e.v5,
        v6 = e.v6,
        v7 = e.v7,
        v9 = e.v9,
        v10 = e.v10,
        v11 = e.v11,
        v12 = e.v12,
        v14 = e.v14,
        v16 = e.v16,
        v17 = e.v17,
        v18 = e.v18,
        v19 = e.v19,
        v21 = e.v21,
        amount = e.amount,
        transactionId = e.transactionId
      )).to(atLeastOnceSink(out))

    def flow = Flow[(TxRecord, PipelinesContext)]
  }
}

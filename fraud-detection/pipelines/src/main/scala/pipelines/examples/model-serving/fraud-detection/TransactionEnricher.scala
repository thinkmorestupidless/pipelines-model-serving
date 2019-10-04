package pipelines.examples.modelserving.frauddetection

import pipelines.akkastream.AkkaStreamlet
import pipelines.akkastream.scaladsl.{ FlowWithPipelinesContext, RunnableGraphStreamletLogic }
import pipelines.examples.modelserving.frauddetection.data.{ TxEnrichedRecord, TxRecord }
import pipelines.streamlets.{ StreamletShape, StringConfigParameter }
import pipelines.streamlets.avro.{ AvroInlet, AvroOutlet }

object TransactionEnricher extends AkkaStreamlet {
  val in = AvroInlet[TxRecord]("in")
  val out = AvroOutlet[TxEnrichedRecord]("out") //, (tx: TxEnrichedRecord) ⇒ tx.nameOrig + "-" + tx.nameDest)

  val shape = StreamletShape(in).withOutlets(out)

  val EnrichmentResource = StringConfigParameter(
    key = "enrichmentTable",
    description = "Provide the resource to use for transaction enrichment"
  )

  override def configParameters = Vector(EnrichmentResource)

  override def createLogic = new RunnableGraphStreamletLogic() {

    // load enrichment table using resource

    def runnableGraph = atLeastOnceSource(in).via(flow).to(atLeastOnceSink(out))
    // var step: Int, var `type`: String, var amount: Double, var nameOrig: String, var oldbalanceOrig: Double, var newbalanceOrig: Double, var nameDest: String, var oldbalanceDest: Double, var newbalanceDest: Double
    def flow = FlowWithPipelinesContext[TxRecord].map(e ⇒ TxEnrichedRecord(
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
    ))

  }

}

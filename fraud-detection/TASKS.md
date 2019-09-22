# Tasks

The following need to be completed to get the full demo together:

## Add `customerId` and `deviceId` fields to the `creditcard.csv` data
   
The plan is to have an 'enhance' or 'filter' stage in the Pipeline which will check to see if a transaction coming from customer is using a 'trusted device'.
   
If the transaction is coming from a device trusted for that customer then we can short-circuit the fraud detection step and approve the transaction.
   
This 'filter' step requires a service to call out to from a `mapAsync(p)` step in the Akka Stream. Ideally this would be an `ask` on an actor but for simplicity's sake let's just create a Lagom service that we can push data to to set it up. The Lagom Entity will represent the Customer - match the customer Id and have a set of deviceIds that are trusted for the customer.

My thoughts on doing this were to:

- [ ] Generate a set of random UUIDs representing Customer Ids
- [ ] For each customer UUID generate a set of Device Ids - flag some of those Ids as trusted
- [ ] Load the `creditcard.csv` data and assign a random Customer UUID to each tx as well as a random Device Id related to that Customer
- [ ] Load the Customers and their Device IDs into the Lagom service
- [ ] Add the service call to the running Pipeline so Lagom's `runAll` and Pipeline's `runLocal` can bring everything up locally to test as well as running remotely on K8s 

## Make `tensorflowModel` score correctly when being served in Pipelines
 
 Currently both the fraudulent and normal transactions both score a 0.0 from the model when running the Pipeline and POSTing those sample data files in `/testing`
 
 Need to check that the model is actually scoring data when running in the notebook. I'm getting a high score from the model but the data is very unbalanced - there are very few fraudulent transactions in that dataset compared the normal transactions.
 
 I'd suggest:
 
 - [ ] Ensuring it can score the data when the model is running in the notebook
 - [ ] Ensure the optimised model can score when being run with [Tensorflow Serving](https://www.tensorflow.org/tfx/serving/docker)
 - [ ] See if that fixes it in Pipelines...
 
 It may well be necessary to use a different model implementation - but beware the saving of the optimised model is a pain so i'm hoping that saving process isn't part of the problem.

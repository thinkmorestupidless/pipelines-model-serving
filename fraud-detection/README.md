# Fraud Detection 

> Note: This is a demo application - see the [Story](DEMO_STORY.md) page for how to deliver it.

## Getting Started

A couple of things before you `buildAndPublish`

You'll need to:

- Download the data used to train the model and feed through the running Pipeline. 

And, optionally

- Train and export the model(s)

### Downloading Sample Data

The data is available in a `.zip` file stored here

https://fraud-detection-demo.s3-eu-west-1.amazonaws.com/creditcard.csv.zip

- Download the file
- Unzip it
- Place a copy in 
  - `./fraud-detection/notebooks/data` and 
  - `./fraud-detection/src/main/resources/data`
  
### Training/Exporting the Models

- Run Juptyer and execute the notebooks

> I've used Anaconda to load the notebook - the only dependency not available by default is `keras`. However, there's an `environment.yml` you can use to load the environment i've used to generate the checked-in model.
> ```shell script
> cd notebooks
> conda env create -f environment.yml
> jupyter notebook
> ```
> 

From there you can select each notebook and run each stage to understand more about the models and actually generate them.

Model checkpoint files and frozen model stages will be output to `./notebooks/output/{model_name}`

Optimised models will be output to the `./src/main/resources/models` directory from the notebooks.

### Running Locally

Run SBT and select the `fraudDetection` project, then `runLocal` will compile and get everything working locally for you.

```shell script
sbt
project fraudDetection
runLocal
```

#### Testing the Model

There are 2 `.json` files in the `./testing` directory that you can push to the pipeline to check the model output.

Both files were created with data from the `creditcard.csv` data file.

> `runLocal` will assign a port to the `tx-ingress` streamlet when it starts up the pipeline - it seems to select 3004 every time for me however, you'll need to substitute yours in the commands below

##### Fraudulent Transaction

```shell script
curl -X POST -H "Content-Type: application/json" -d @testing/fraud.json http://localhost:3004
```

##### Normal Transaction

```shell script
curl -X POST -H "Content-Type: application/json" -d @testing/normal.json http://localhost:3004
```


This project contains three example pipelines:

1. Judge the quality of wine using models that are served within a streamlet process.
2. Make product recommendations using models that are served _as a service_ using Kubeflow.
3. Predict air traffic delays using an H2O embedded "MOJO" model.

In addition, it contains prototypes for reusable "contrib" libraries for Pipelines:

* `pipelinesx` - (inspired by `javax`) Miscellaneous helper classes and utilities for writing Pipelines streamlets (including test _ingress_ streamlets that simulate loading data from external sources), examples, and test tools. It uses the package name structure `pipelines.<subject>`.
* `model-serving` - classes for managing heterogeneous models (TensorFlow, PMML, H2O, and potentially others) and serving them. Because this content is not specific to Pipelines, it uses the package structure `com.lightbend.modelserving...`.

## Setup

You can start `sbt` and run `test` successfully without any additional setup, but to run some of the sample applications in Pipelines, additional setup is required.

### InfluxDB Setup - for Wine Quality and Airline Flights Examples

> NOTE: At this time, the _egress_ streamlets that write to InfluxDB are not used in the corresponding blueprints for the wine and airline apps. If you want to use Influx, edit those blueprint files, uncommenting the lines that use the egresses with `Influx` in their names, and commenting the corresponding lines that don't use them.

Wine input records and scoring results are written to InfluxDB, as an example of a downstream consumer. Similarly for the Airline flights app.

To setup and use InfluxDB, first Install the InfluxDB CLI on your workstation. On a Macintosh, you can use HomeBrew:

```shell
brew install influxdb
```

Make sure you are connected to your Kubernetes cluster and run the following command to install InfluxDB on the cluster:

```shell
helm install stable/influxdb --name influxdb --namespace influxdb
```

This will create a service named `influxdb.influxdb.svc`. You'll need that string below.

Port forward to access InfluxDB locally on your workstation:

```shell
kubectl port-forward --namespace influxdb $(kubectl get pods --namespace influxdb -l app=influxdb -o jsonpath='{ .items[0].metadata.name }') 8086:8086
```

Connect to influxDB, using the `influx` client command you just installed, and create one or both of the following databases, depending on which of the two apps you intend to run:

```shell
influx -execute 'create database airline_ml' -host localhost -port 8086
influx -execute 'create database wine_ml' -host localhost -port 8086
```

You can use different database names, but make the corresponding configuration changes in the following steps.

If you changed anything above, the service name, the port, or the database name used, you'll need to edit one or both configuration files:

* Wine app: `wine-quality-ml/src/main/resources/reference.conf`
* Airlines app: `airline-flights-ml/src/main/resources/reference.conf`

Edit the `host`, `port`, and `database` fields to match your setup. Here is the default content for the Wine app in `wine-quality-ml/src/main/resources/reference.conf`:

```
...
influxdb : {
  host : "influxdb.influxdb.svc",
  port : 8086,
  database : "wine_ml"
}
```

For the Airline app, it is the same, except for the database name, in `airline-flights-ml/src/main/resources/reference.conf`:


```
influxdb : {
  host : "influxdb.influxdb.svc",
  port : 8086,
  database : "airline_ml"
}
```

> NOTE: You can also override these config values on the command-line, as discussed below.

### Setup TF serving - Recommender Example

Running the TensorFlow Docker image is the easiest way to use TensorFlow Serving. The full details are [here](https://medium.com/tensorflow/serving-ml-quickly-with-tensorflow-serving-and-docker-7df7094aa008).
Here we will discuss 2 installations - local for unit testing and on the cluster for pipeline testing.

#### Local testing

In order to test locally, first load tensorflow serving docker image
````
docker pull tensorflow/serving:1.14.0
````

Now you can start the image using the following command:

````
docker run -p 8501:8501 --name tfserving_recommender --mount type=bind,source=<location of data/recommender/model>,target=/models/recommender -e MODEL_NAME=recommender -t tensorflow/serving:1.14.0
````

Once the image is up and running, you can visit the available [REST APIs](https://www.tensorflow.org/serving/api_rest), to get information about deployed model, for example:

* http://localhost:8501/v1/models/recommender/versions/1 to get the status of the deployed model
* http://localhost:8501/v1/models/recommender/versions/1/metadata to get metadata about deployed model.

Rest APIs are also used to serve the model:

```bash
curl -X POST http://localhost:8501/v1/models/recommender/versions/1:predict -d '{"signature_name":"serving_default","inputs": {"products": [[1],[2]],"users" : [[25], [3]]}}'
```

This returns the following result:

```json
{
    "outputs": {
        "model-version": [
            "1"
        ],
        "recommendations": [
            [
                0.0940792412
            ],
            [
                0.0264799967
            ]
        ]
    }
```
Once local install is imn place, you can run local test

#### Kubernetes testing

Use provided [Helm chart](recommender-ml/supportchart) to start an instance of TF-serving in the cluster.
Then you can use created service to access it 

## Build and Deploy the Applications

If you run any of the following commands in the "root" project (`pipelines-model-serving`), you'll get errors about multiple blueprint files being disallowed by Pipelines.

So, decide which of the three projects you want to build and deploy, then change to that project in `sbt` and run `buildAndPublish`.

Specifically, from the `sbt` prompt, do _one_ of the following first:

1. Wine quality: `project wineModelServingPipeline` (corresponding to the directory `wine-quality-ml`)
2. Airline flights: `project airlineFlightsModelServingPipeline` (corresponding to the directory `airline-flights-ml`)
3. Recommender: `project recommenderModelServingPipeline` (corresponding to the directory `recommender-ml`)

Now build the project:

```
buildAndPublish
```

> NOTE: The first task performed is `verifyBlueprint`, which verifies the blueprint is valid. You can run this command separately if you just want to check it after doing edits.

The image name will be based on one of the following strings, where `USER` will be replaced with your user name at build time (so you and your colleagues can easily run separate instances of the same app...):

* Wine app: `wine-quality-ml-USER`
* Airline app: `airline-flights-ml-USER`
* Recommender app: `recommender-ml-USER`

The full image identifier is printed as part of the output of the `buildAndPublish` command. It includes the Docker registry URL for your cluster and the auto-generated tag for the image. Copy and past that text for the deployment command next, replacing the placeholder `IMAGE` shown with the text. Note: this command uses `kubectl`, so it is run on a separate shell window:

```shell
kubectl pipelines deploy IMAGE
```

> NOTE: If you are on OpenShift and prefer the `oc` command, replace `kubectl` with `oc plugin`.

For the airline and wine apps, you can also override InfluxDB parameters on the command line (or any other configuration parameters, really). For the wine app, it would look as follows, where any or all of the configuration flags could be given. Here, the default values are shown on the right hand sides of the equal signs:

```shell
kubectl pipelines deploy IMAGE \
  wine-quality.influxdb.host="influxdb.influxdb.svc" \
  wine-quality.influxdb.port="8086" \
  wine-quality.influxdb.database="wine_ml"
```

Similarly, for the airline app:

```shell
kubectl pipelines deploy IMAGE \
  airline-flights.influxdb.host="influxdb.influxdb.svc" \
  airline-flights.influxdb.port="8086" \
  airline-flights.influxdb.database="airline_ml"
```

## Notes

Some miscellaneous notes about the code.

### Avro Issues

If you compile and a lot of things are reported as undefined that you _know_ should be there, run `clean` followed by `compile`.

If you see warnings about classes generated by Avro shadowing other versions, run `clean` followed by `compile.

The `model-server` project defines some shared types using Avro that are embedded within other record types sent between streamlets. Unfortunately, Avro does not support this embedding _unless_ these "reusable" files are parsed by Avro at the same time as the schemas that include them. Hence, we use a hack to make this work without copying over the schemas.

Each app project (i.e., `wine-quality-ml`, ...) adds the following setting:

```
avroSpecificSourceDirectories in Compile ++=
  Seq(new java.io.File("model-serving/src/main/avro"))
```

So, when that project's `*.avsc` files are parsed, the shared files in `model-serving` will also be parsed, _again_, and the output code will be compiled into that project's jar file. This means that when the app is deployed, there will be _two_ copies of the class files for these shared classes. This is "safe", because the classes are identical, but not very "clean". Hence, a future version of this code will need to eliminate this duplication.

### Ingress with "Canned" Data

The airline and wine apps use freely-available data sets (discussed below). The recommender app generates fake data. Hence, ingress in these examples uses data files, rather than "live" sources like Kafka topics, as you might expect from sample applications.

A `pipelinesx.ingress.RecordsReader` class (under the `pipelinesx` project) is used by the airline and wine apps to make this process easy. It supports programmatic specification of resources to be read from the local file system, from the classpath (i.e., added to the `src/main/resources` directory of a project and compiled into the archives), or from URLs. In addition, it supports a configuration-driven method for specifying which source and which files to load in the `src/main/resources/application.conf` file (using HOCON format and the [Typesafe Config](https://github.com/lightbend/config) library), so it's easy to change how it's done by simply changing the configuration. See the class comments for `RecordsReader` for details and see the `*/src/main/resources/reference.conf` and `*/src/test/resources/reference.conf` files for examples.

For the airline app, the full data set available from http://stat-computing.org/dataexpo/2009/ is many GBs in size. The `airline-flights-ml/src/main/resources/reference/reference.conf` specifies that the _ingress_ streamlet should only download a few of the files available from the website. This happens when the streamlet starts. They are stored on the local file system, so if you decide to use more of the files, keep in mind the local disk requirement and the startup overhead for downloading on every startup. (They are cached locally, but if the pod is restarted...). Also, downloading too many files, which is not down asynchronously at this time, can cause Kubernetes to think the pod is dead, if it takes too long!

Also, for convenience, there is a truncated data file from 1990, about 1MB in size, in `airline-flights-ml/src/main/resources/airlines/data/1990-10K.csv`. Use that file instead when demoing the app in situations when startup time needs to be as fast as possible, _or_ you are demoing the app in an on-premise K8s cluster with restrictive access to the Internet. (Change `reference.conf` to use `FileSystem` instead of `URLs` for `which-one`.) Note that it won't make any difference if your laptop has poor Internet connectivity; this download process at startup only happens in the cluster (unless you run the unit tests...), so only the cluster network situation is important.

> WARNING: If you decide to add more files to the `CLASSPATH` instead, keep in mind that these files are bundled into the application Docker image, so avoid loading too many of them or the image size will be huge!

In contrast the airline app does not attempt to load new model files. The single model is stored in `.../src/main/resources/airlines/models` and loaded from the `CLASSPATH` at startup.

The wine data and models are both embedded in the `CLASSPATH`, by default.

### Running Some of this Code with "Main" Routines

There are a number of `main` routines available for "mini-testing". All are under three application subprojects listed above.

However, if you just type `run` in those projects, you'll invoke a Pipelines runner that is under development, rather than get a prompt with the available `main` classes.

Instead, use `sbt show determineMainClasses` to find the full paths and then use `sbt runMain foo.bar.Baz` to run the specific example you want. Some of these commands take invocation options, including a `-h` or `--help` option to describe them. All of these classes have code comments with more specific details about running them.

## Sample Data Sets

The wine application is inspired by this source, where the data was retrieved:
https://www.kaggle.com/uciml/red-wine-quality-cortez-et-al-2009

The airline data comes from this data set, http://stat-computing.org/dataexpo/2009/the-data.html, where you can see the full list of available data files. By default, the airline app data ingress downloads a few of these files at startup.

## Debugging Notes

### Pods Fail to Load Do to Docker Repo Auth Errors (OpenShift)

Even if you log into the Docker repo in the cluster, you might get pod deployment errors with events that report that authentication against the repo failed, so the images could not be pulled.

This appears to happen most often when an application has existed for a while, beyond timeouts for various logins.

Workaround: in the OpenShift GUI, go to _applications_ and delete your application, then redeploy. When you redeploy (i.e., `kubectl pipelines deploy {image:tag}`), if you get prompted for the user name and password, then you'll be successful! Use the same credentials you used for the `docker login` command.

### Logging

There is a mix of Akka logging, SLF4J, and generic `Console.out` logging. Get to the logs via Openshift GUI > appplications > my_application > Pods. Or, use `kubectl`:

```shell
kubectl pipelines status <my-app>
kubectl logs -n <my-app> <pod-name>
```

Note that the app name is used as the namespace by Pipelines. For example:


```shell
kubectl pipelines status airline-flights-ml-bucktrends
kubectl logs -n airline-flights-ml-bucktrends airline-flights-ml-bucktrends-model-serving-UUID-stuff
...
```

Note that some logging is done at the `DEBUG` level. If you suspect problems, change the `logback*.xml` settings or for the `Console.out` logging, change `log.debug` to `log.info`!
## Improving this Project

There is a [GitHub Project](https://github.com/lightbend/pipelines-model-serving/projects/1) with TODO items, etc.

Copyright (C) 2019 Lightbend Inc. (https://www.lightbend.com).


import sbt._
import sbt.Keys._
import scalariform.formatter.preferences._
import Dependencies._

lazy val thisVersion = "1.3.0"
version in ThisBuild := thisVersion
fork := true

lazy val fraudDetectionPipeline = (project in file("./fraud-detection/pipelines"))
  .enablePlugins(PipelinesApplicationPlugin)
  .settings(
    name := s"fraud-detection",
    version := thisVersion,
    runLocalConfigFile := Some("fraud-detection/pipelines/src/main/resources/local.conf"),
    pipelinesDockerRegistry := Some("gcr.io/gsa-pipeliners")
  )
  .settings(commonSettings)
  .dependsOn(fraudDetectionSchema, fraudDetectionSpark, fraudDetectionAkkaStreams, pipelinesx, modelServing)

lazy val fraudDetectionSchema = (project in file("./fraud-detection/schema"))
  .enablePlugins(PipelinesLibraryPlugin)
  .settings(
    avroSpecificSourceDirectories in Compile ++=
      Seq(new java.io.File("model-serving/src/main/avro"))
  )

lazy val fraudDetectionAkkaStreams = (project in file("./fraud-detection/akka-streams"))
  .enablePlugins(PipelinesAkkaStreamsLibraryPlugin)
  .settings(
    commonSettings,
    libraryDependencies ++= Seq(akkaSprayJson, influx, scalaTest)
  )
  .dependsOn(fraudDetectionSchema, modelServing, pipelinesx)

lazy val fraudDetectionSpark = (project in file("./fraud-detection/spark"))
  .enablePlugins(PipelinesSparkLibraryPlugin)
  .settings(
    commonSettings,
    Test / parallelExecution := false,
    Test / fork := true,
    libraryDependencies ++= Seq(scalaTest)
  )
  .dependsOn(fraudDetectionSchema)

lazy val pipelinesx = (project in file("./pipelinesx"))
  .enablePlugins(PipelinesLibraryPlugin)
  .enablePlugins(PipelinesAkkaStreamsLibraryPlugin)
  .settings(
    name := "pipelinesx",
    libraryDependencies ++= logging ++ Seq(/*alpakkaKafka,*/ bijection, json2avro, influx, scalaTest)
  )
  .settings(commonSettings)

lazy val modelServing = (project in file("./model-serving"))
  .enablePlugins(PipelinesAkkaStreamsLibraryPlugin)
  .settings(
    name := "model-serving",
    libraryDependencies ++= Seq(tensorflow, tensorflowProto, pmml, pmmlextensions, h2o, bijection, json2avro, gson, scalajHTTP, scalaTest)
  )
  .settings(commonSettings)
  .dependsOn(pipelinesx)

lazy val commonScalacOptions = Seq(
    "-encoding", "UTF-8",
    "-target:jvm-1.8",
    "-Xlog-reflective-calls",
    "-Xlint:_",
    "-deprecation",
    "-feature",
    "-language:_",
    "-unchecked"
  )

lazy val scalacTestCompileOptions = commonScalacOptions ++ Seq(
  //"-Xfatal-warnings",
  "-Ywarn-dead-code",                  // Warn when dead code is identified.
  "-Ywarn-extra-implicit",             // Warn when more than one implicit parameter section is defined.
  "-Ywarn-numeric-widen",              // Warn when numerics are widened.
  "-Ywarn-unused:implicits",           // Warn if an implicit parameter is unused.
  "-Ywarn-unused:imports",             // Warn if an import selector is not referenced.
  "-Ywarn-unused:locals",              // Warn if a local definition is unused.
  //"-Ywarn-unused:params",              // Warn if a value parameter is unused. (But there's no way to suppress warning when legitimate!!)
  "-Ywarn-unused:patvars",             // Warn if a variable bound in a pattern is unused.
  "-Ywarn-unused:privates",            // Warn if a private member is unused.
)
// Ywarn-value-discard is particularly hard to use in many tests,
// because they error-out intentionally in ways that are expected, so it's
// usually okay to discard values, where that's rarely true in regular code.
lazy val scalacSrcCompileOptions = scalacTestCompileOptions ++ Seq(
  "-Ywarn-value-discard")

lazy val commonSettings = Seq(
  scalaVersion := "2.12.8",
  scalacOptions in Compile := scalacSrcCompileOptions,
  scalacOptions in Test := scalacTestCompileOptions,
  scalacOptions in (Compile, console) := commonScalacOptions,
  scalacOptions in (Test, console) := commonScalacOptions,

  scalariformPreferences := scalariformPreferences.value
    .setPreference(AlignParameters, true)
    .setPreference(AlignSingleLineCaseStatements, true)
    .setPreference(AlignSingleLineCaseStatements.MaxArrowIndent, 90)
    .setPreference(DoubleIndentConstructorArguments, true)
    .setPreference(DoubleIndentMethodDeclaration, true)
    .setPreference(IndentLocalDefs, true)
    .setPreference(IndentPackageBlocks, true)
    .setPreference(RewriteArrowSymbols, true)
    .setPreference(DanglingCloseParenthesis, Preserve)
    .setPreference(NewlineAtEndOfFile, true)
    .setPreference(AllowParamGroupsOnNewlines, true)
    .setPreference(SpacesWithinPatternBinders, false) // otherwise case head +: tail@_ fails to compile!

)

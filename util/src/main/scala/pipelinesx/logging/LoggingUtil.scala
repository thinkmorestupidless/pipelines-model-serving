package pipelinesx.logging

import org.slf4j.{ Logger => SLogger, LoggerFactory => SLoggerFactory }
import akka.actor.ActorSystem
import akka.event.{ Logging => ALogging }
import akka.event.Logging.{ LogLevel => ALogLevel, InfoLevel => AInfoLevel }
import java.io.PrintStream

/**
 * Wrapper around logging to support SLF4J, Akka Logging, and stdout. The _only_
 * reason this exists is to make it easier to capture logged output during tests
 * for verification or to suppress the output (after all other attempts at this
 * failed...).
 */
trait Logger {
  /** See implementations for details on behavior. */
  def log(msg: String): Unit
  def debug(msg: String): Unit
  def info(msg: String): Unit
  def warn(msg: String): Unit
  def error(msg: String): Unit
}

final class MutableLogger(var logger: Logger) extends Logger {
  def setLogger(l: Logger): Unit = logger = l

  def log(msg: String): Unit = logger.log(msg)
  def debug(msg: String): Unit = logger.debug(msg)
  def info(msg: String): Unit = logger.info(msg)
  def warn(msg: String): Unit = logger.warn(msg)
  def error(msg: String): Unit = logger.error(msg)
}

final case class SLF4JLogger(logger: SLogger) extends Logger {
  /** Since there is no generic "log" method in the SLF4J logger, this method logs as INFO. */
  def log(msg: String): Unit = info(msg)
  def debug(msg: String): Unit = logger.debug(msg)
  def info(msg: String): Unit = logger.info(msg)
  def warn(msg: String): Unit = logger.warn(msg)
  def error(msg: String): Unit = logger.error(msg)
}

final case class AkkaLogger(system: ActorSystem, level: ALogLevel) extends Logger {
  /** Uses the LogLevel passed in as a constructor argument. */
  def log(msg: String): Unit = system.log.log(level, msg)
  def debug(msg: String): Unit = system.log.debug(msg)
  def info(msg: String): Unit = system.log.info(msg)
  def warn(msg: String): Unit = system.log.warning(msg)
  def error(msg: String): Unit = system.log.error(msg)
}

/** Writes debug and info messages to stdout, warn and error messages to stderr */
final case class StdoutStderrLogger(clazz: Class[_]) extends Logger {
  val className = clazz.getName
  /** Treats the message as an INFO message. */
  def log(msg: String): Unit = info(msg)
  def debug(msg: String): Unit = StdoutStderrLogger.write(Console.out, "DEBUG", className, msg)
  def info(msg: String): Unit = StdoutStderrLogger.write(Console.out, "INFO", className, msg)
  def warn(msg: String): Unit = StdoutStderrLogger.write(Console.err, "WARN", className, msg)
  def error(msg: String): Unit = StdoutStderrLogger.write(Console.err, "ERROR", className, msg)
}
object StdoutStderrLogger {
  def write(out: PrintStream, level: String, className: String, message: String): Unit =
    out.println(makeMessage(level, className, message))

  def makeMessage(level: String, className: String, message: String): String =
    s"[$level] ($className): $message"
}

object LoggingUtil {
  // Global hook to configure which logger API is used.
  var useSLF4J: Boolean = false

  /**
   * Always call this method to create the default SL4J logger, wrapped in a [[MutableLogger]].
   * To override in a test to use stdout, call `mylogger.setLogger(StdoutStderrLogger)`.
   */
  def getLogger[T](clazz: Class[T]): MutableLogger = {
    // val which = if (useSLF4J) "SLF4J" else "stdout/stderr"
    // StdoutStderrLogger.write(Console.out, "INFO", this.getClass.getName, s"By default, using $which logger")

    if (useSLF4J) new MutableLogger(SLF4JLogger(SLoggerFactory.getLogger(clazz)))
    else new MutableLogger(StdoutStderrLogger(clazz))
  }
}

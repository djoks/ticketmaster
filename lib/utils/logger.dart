import 'package:logger/logger.dart';

/// A [LogOutput] that forwards log events to multiple outputs.
///
/// This is useful when you want to log to more than one destination, such as
/// the console and a file simultaneously.
class MultiOutput extends LogOutput {
  /// The list of log outputs to which the log events will be forwarded.
  final List<LogOutput> outputs;

  /// Creates a [MultiOutput] instance.
  MultiOutput({required this.outputs});

  @override
  void output(OutputEvent event) {
    // Forward the log event to each registered output.
    for (final output in outputs) {
      output.output(event);
    }
  }
}

/// A global logger instance configured for pretty printing.
///
/// This logger uses a [PrettyPrinter] with custom settings for method count,
/// stack trace display, line length, colors, emojis, and date/time format.
/// Adjust these settings as needed.
final Logger log = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // Number of method calls to display in the log.
    errorMethodCount:
        8, // Number of method calls to display when an error occurs.
    lineLength: 120, // Maximum width of the log output.
    colors: true, // Enable colored log output.
    printEmojis: true, // Display an emoji for each log level.
    dateTimeFormat: DateTimeFormat.dateAndTime, // Format for the log timestamp.
  ),
  output: MultiOutput(
    outputs: [ConsoleOutput()],
  ),
);

import 'package:logger/logger.dart';

/// Custom LogOutput that sends log events to multiple outputs.
class MultiOutput extends LogOutput {
  final List<LogOutput> outputs;

  MultiOutput({required this.outputs});

  @override
  void output(OutputEvent event) {
    for (final output in outputs) {
      output.output(event);
    }
  }
}

/// Global logger instance. Adjust the file path as needed.
final Logger log = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 120, // width of the output
    colors: true, // colorized logs
    printEmojis: true, // emoji for each log level
    dateTimeFormat: DateTimeFormat.dateAndTime, // custom time format
  ),
  output: MultiOutput(
    outputs: [ConsoleOutput()],
  ),
);

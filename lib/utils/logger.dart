import 'dart:io'; // Importing dart:io for platform-specific information

import 'package:logger/logger.dart'; // Importing the logger package for logging functionality

/// A custom log filter that logs all events all the time.
class LogAllTheTimeFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // Always return true to log all events
    return true;
  }
}

/// A logger instance for logging messages with various configurations.
Logger logger = Logger(
  filter: LogAllTheTimeFilter(), // Setting the log filter to LogAllTheTimeFilter to log all events
  printer: PrettyPrinter(
    methodCount: 4, // Number of methods to be shown in the log output
    errorMethodCount: 16, // Number of methods to be shown for errors in the log output
    colors: !Platform.isIOS, // Whether to use colors in the log output (disabled for iOS)
  ),
  output: MultiOutput([
    ConsoleOutput(), // Output to the console
    // SentryOutput(), // Additional output to Sentry (commented out for now)
  ]),
);

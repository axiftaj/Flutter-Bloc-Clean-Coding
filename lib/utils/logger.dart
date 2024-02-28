import 'dart:io';

import 'package:logger/logger.dart';

class LogAllTheTimeFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // TODO
    return true;
  }
}

Logger logger = Logger(
  filter: LogAllTheTimeFilter(),
  printer: PrettyPrinter(
    methodCount: 4,
    errorMethodCount: 16,
    colors: !Platform.isIOS,
  ),
  output: MultiOutput([
    ConsoleOutput(),
    // SentryOutput(),
  ]),
);

import 'package:logger/logger.dart';

class Logg {
  static void error(String errorMessage) {
    var loggerError = Logger(
      printer: PrettyPrinter(methodCount: 2, stackTraceBeginIndex: 1),
    );
    loggerError.e(errorMessage);
  }

  static void information(String message) {
    var loggerInformation = Logger(
      printer: PrettyPrinter(
          methodCount: 2, stackTraceBeginIndex: 1, printEmojis: false),
    );
    loggerInformation.w(message);
  }

  static void consoleShow(String message) {
    var loggerConsole = Logger(
      printer: PrettyPrinter(methodCount: 0, printEmojis: false),
    );
    loggerConsole.i(message);
  }
}

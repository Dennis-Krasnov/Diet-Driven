import 'package:logger/logger.dart';

class CustomLogFilter extends LogFilter {
  @override
  bool shouldLog(Level level, dynamic message, [dynamic error, StackTrace stackTrace]) {
    return true;
  }
}

class CustomLogPrinter extends LogPrinter {
  final String className;

  CustomLogPrinter(this.className);

  @override
  void log(Level level, dynamic message, dynamic error, StackTrace stackTrace) {
//    https://loige.co/random-emoji-in-your-prompt-how-and-why/
    final colour = PrettyPrinter.levelColors[level]; // TODO: custom colours
    final emoji = PrettyPrinter.levelEmojis[level]; // TODO: custom icons

    println(colour("$emoji $className - $message"));
  }

}

class CustomOutput extends LogOutput {
  @override
  void output(Level level, List<String> lines) {
    switch (level) {
      case Level.verbose:
        // TODO: Handle this case.
        break;
      case Level.debug:
        // TODO: Handle this case.
        break;
      case Level.info:
      case Level.warning:
      case Level.error:
      case Level.wtf:
        // Blank line
        print("");
        break;
      case Level.nothing:
        // TODO: Handle this case.
        break;
    }
    lines.forEach(print);
  }
}

Logger getLogger(String className) => Logger(
  filter: CustomLogFilter(),
  printer: CustomLogPrinter(className),
  output: CustomOutput(),
);

import 'package:ansicolor/ansicolor.dart';

///
enum LogLevel {
  ui,
  fine,
  debug,
  info,
  warning,
  severe,
}

///
String levelToEmoji(LogLevel level) {
  switch (level) {
    case LogLevel.ui:
      return "▫️";
      break;
    case LogLevel.fine:
      return " ";
      break;
    case LogLevel.debug:
      return "🐛";
      break;
    case LogLevel.info:
      return "ℹ️";
      break;
    case LogLevel.warning:
      return "⚠️";
      break;
    case LogLevel.severe:
      return "‼️";
      break;
    default:
      throw UnimplementedError("Unkonwn level: $level");
  }
}

///
AnsiPen levelToPen(LogLevel level) {
  final pen = AnsiPen();

  switch (level) {
    case LogLevel.ui:
      pen.gray(level: 0.5);
      break;
    case LogLevel.fine:
      pen.gray(level: 0.5);
      break;
    case LogLevel.debug:
      pen.gray(level: 0.75);
      break;
    case LogLevel.info:
      break;
    case LogLevel.warning:
      pen.yellow();
      break;
    case LogLevel.severe:
      pen.red();
      break;
    default:
      throw UnimplementedError("Unkonwn level: $level");
  }

  return pen;
}
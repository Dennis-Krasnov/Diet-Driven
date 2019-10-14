import 'package:bloc_logging/log_level.dart';

class BlocLogger {
  /// Global singleton
  static final _singleton = BlocLogger._();
  factory BlocLogger() => _singleton;
  BlocLogger._();

  ///
  var enabled = true;

  ///
  var blocEventsEnabled = false;

  ///
  var blocTransitionsEnabled = false;

  ///
  var messageThreshold = LogLevel.ui;

  void log(dynamic message, LogLevel level) => _logMessage;//(level, message);

  /// Helper message functions
  void ui(dynamic message, {dynamic error, StackTrace stacktrace}) =>
      _logMessage(message, LogLevel.ui, error: error, stacktrace: stacktrace);

  void fine(dynamic message, {dynamic error, StackTrace stacktrace}) =>
    _logMessage(message, LogLevel.fine, error: error, stacktrace: stacktrace);

  void debug(dynamic message, {dynamic error, StackTrace stacktrace}) =>
    _logMessage(message, LogLevel.debug, error: error, stacktrace: stacktrace);

  void info(dynamic message, {dynamic error, StackTrace stacktrace}) =>
    _logMessage(message, LogLevel.info, error: error, stacktrace: stacktrace);

  void warning(dynamic message, {dynamic error, StackTrace stacktrace}) =>
    _logMessage(message, LogLevel.warning, error: error, stacktrace: stacktrace);

  void severe(dynamic message, {dynamic error, StackTrace stacktrace}) =>
    _logMessage(message, LogLevel.severe, error: error, stacktrace: stacktrace);

  /// Helper exception functions
  void expectedError(dynamic message, dynamic error, [StackTrace stacktrace]) =>
    _logMessage(message, LogLevel.info, error: error, stacktrace: stacktrace);

  void unexpectedError(dynamic message, dynamic error, [StackTrace stacktrace]) =>
    _logMessage(message, LogLevel.severe, error: error, stacktrace: stacktrace);

  /// Bloc helper functions
  /// TODO: type bloc properly (import bloc!, might as well generic-alize function for proper event type!)
  void blocEvent(dynamic bloc, dynamic event, {LogLevel level = LogLevel.fine}) => _logBlocEvent(bloc, event, level);

  void blocTransition(dynamic bloc, dynamic before, dynamic event, dynamic after) => _logBlocTransition(bloc, before, event, after);

  ///
  void _logMessage(dynamic message, LogLevel level, {dynamic error, StackTrace stacktrace}) {
    if (!enabled) return;
    if (level.index < messageThreshold.index) return;

    //
    String messageText = message is Function ? message().toString() : "$message";

    // Colourise output
    final pen = levelToPen(level);

    print(pen("${levelToEmoji(level)}   $messageText"));

    // Print error
    if (error != null) {
      print(error);
    }

    // Print stack trace
    if (stacktrace != null) {
      print(error);
    }
  }

  void _logBlocEvent(dynamic bloc, dynamic event, LogLevel level) {
    if (!enabled) return;
    if (!blocEventsEnabled) return;

    // TODO
    print("${bloc.runtimeType} Event - $event");
  }

  void _logBlocTransition(dynamic bloc, dynamic before, dynamic event, dynamic after) {
    if (!enabled) return;
    if (!blocTransitionsEnabled) return;

    // TODO
    print(bloc.runtimeType);
    print(before);
    print(event);
    print(after);
  }
}
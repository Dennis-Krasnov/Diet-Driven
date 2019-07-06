import 'package:built_value/built_value.dart';
import 'package:diet_driven/blocs/logging/logging_state.dart';

part 'logging_events.g.dart';

//abstract class LoggingEvent implements Built<LoggingEvent, LoggingEventBuilder> {
//  /// Severity of log
//  LoggingLevel get level;
//
//  /// Text of log
//  String get text;
//
//  factory LoggingEvent([void Function(LoggingEventBuilder) updates]) = _$LoggingEvent;
//  LoggingEvent._();
//}

abstract class LoggingEvent {}

///
abstract class SendAnonymousLogsToDeveloper implements LoggingEvent, Built<SendAnonymousLogsToDeveloper, SendAnonymousLogsToDeveloperBuilder> {
  factory SendAnonymousLogsToDeveloper([void Function(SendAnonymousLogsToDeveloperBuilder) updates]) = _$SendAnonymousLogsToDeveloper;
  SendAnonymousLogsToDeveloper._();
}

abstract class LogError implements LoggingEvent, Built<LogError, LogErrorBuilder> {
  /// Severity of log
  ErrorLoggingLevel get level;

  /// ...
  Object get error;

  /// ...
  StackTrace get stacktrace;

  factory LogError([void Function(LogErrorBuilder) updates]) = _$LogError;
  LogError._();
}

abstract class LogMessage implements LoggingEvent, Built<LogMessage, LogMessageBuilder> {
  /// Severity of log
  MessageLoggingLevel get level;

  /// Text of log
  String get text;

  factory LogMessage([void Function(LogMessageBuilder) updates]) = _$LogMessage;
  LogMessage._();
}

abstract class LogBlocTransition implements LoggingEvent, Built<LogBlocTransition, LogBlocTransitionBuilder> {
  /// Assumes state and event are created using built value
  Built get currentState;
  Built get event;
  Built get nextState;

  factory LogBlocTransition([void Function(LogBlocTransitionBuilder) updates]) = _$LogBlocTransition;
  LogBlocTransition._();
}

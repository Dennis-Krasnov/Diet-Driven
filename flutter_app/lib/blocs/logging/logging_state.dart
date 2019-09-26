/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

//abstract class LoggingState {}
import 'package:bloc/bloc.dart' show Bloc;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'logging_state.g.dart';


/// Anonymous logging.
abstract class LoggingState implements Built<LoggingState, LoggingStateBuilder> {
  /// Historical list of logs
  BuiltList<Log> get logs;

  factory LoggingState([void Function(LoggingStateBuilder) updates]) = _$LoggingState;
  LoggingState._();
}

//abstract class Log {}

@BuiltValue(instantiable: false)
abstract class Log {
  /// Log description
  String get message;

  /// Time log was created
  DateTime get datetime;

  Log rebuild(void Function(LogBuilder) updates);
  LogBuilder toBuilder();
}

abstract class MessageLog implements Log, Built<MessageLog, MessageLogBuilder> {
  /// Severity of message
  MessageLoggingLevel get level;

  factory MessageLog([void Function(MessageLogBuilder) updates]) = _$MessageLog;
  MessageLog._();
}

abstract class ErrorLog implements Log, Built<ErrorLog, ErrorLogBuilder> {
  /// Severity of error
  ErrorLoggingLevel get level;

  /// ...
  Object get error;

  /// ...
  @nullable
  StackTrace get stacktrace;

  factory ErrorLog([void Function(ErrorLogBuilder) updates]) = _$ErrorLog;
  ErrorLog._();
}

abstract class BlocTransitionLog implements Log, Built<BlocTransitionLog, BlocTransitionLogBuilder> {
  /// Assumes state and event are created using built value
  Built get currentState;
  Built get event;
  Built get nextState;

  factory BlocTransitionLog([void Function(BlocTransitionLogBuilder) updates]) = _$BlocTransitionLog;
  BlocTransitionLog._();
}

/// [MessageLoggingLevel]s to control logging output.
/// Logging can be enabled to include all levels above certain [MessageLoggingLevel].
class MessageLoggingLevel extends EnumClass {
  static Serializer<MessageLoggingLevel> get serializer => _$messageLoggingLevelSerializer;

  /// ...
  static const MessageLoggingLevel verbose = _$verbose;

  /// ...
  static const MessageLoggingLevel debug = _$debug;

  /// ...
  static const MessageLoggingLevel info = _$info;

  /// ...
  static const MessageLoggingLevel warning = _$warning;

  /// ...
  static const MessageLoggingLevel error = _$error;

  // TODO: to colour, to emoji

  const MessageLoggingLevel._(String name) : super(name);

  static BuiltSet<MessageLoggingLevel> get values => _$messageValues;
  static MessageLoggingLevel valueOf(String name) => _$messageValueOf(name);
}

class ErrorLoggingLevel extends EnumClass {
  static Serializer<ErrorLoggingLevel> get serializer => _$errorLoggingLevelSerializer;

  /// ...
  static const ErrorLoggingLevel expected = _$expected;

  /// ...
  static const ErrorLoggingLevel unexpected = _$unexpected;


  // TODO: to colour, to emoji

  const ErrorLoggingLevel._(String name) : super(name);

  static BuiltSet<ErrorLoggingLevel> get values => _$errorValues;
  static ErrorLoggingLevel valueOf(String name) => _$errorValueOf(name);
}

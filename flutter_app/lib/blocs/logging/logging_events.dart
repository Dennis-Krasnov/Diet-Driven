/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:bloc/bloc.dart' show Bloc;
import 'package:built_value/built_value.dart';
import 'package:diet_driven/blocs/logging/logging_state.dart';

part 'logging_events.g.dart';

@BuiltValue(instantiable: false)
abstract class LoggingEvent {
  /// Log description
  String get message;

  LoggingEvent rebuild(void Function(LoggingEventBuilder) updates);
  LoggingEventBuilder toBuilder();
}

///
abstract class SendLogsToDeveloper implements LoggingEvent, Built<SendLogsToDeveloper, SendLogsToDeveloperBuilder> {
  factory SendLogsToDeveloper([void Function(SendLogsToDeveloperBuilder) updates]) = _$SendLogsToDeveloper;
  SendLogsToDeveloper._();
}

///
abstract class LogError implements LoggingEvent, Built<LogError, LogErrorBuilder> {
  /// Severity of error
  ErrorLoggingLevel get level;

  Object get error;

  @nullable
  StackTrace get stacktrace;

  factory LogError([void Function(LogErrorBuilder) updates]) = _$LogError;
  LogError._();
}

///
abstract class LogMessage implements LoggingEvent, Built<LogMessage, LogMessageBuilder> {
  /// Severity of message
  MessageLoggingLevel get level;

  factory LogMessage([void Function(LogMessageBuilder) updates]) = _$LogMessage;
  LogMessage._();
}

///
abstract class LogBlocTransition implements LoggingEvent, Built<LogBlocTransition, LogBlocTransitionBuilder> {
  /// Assumes state and event are created using built value
  Built get currentState;
  Built get event;
  Built get nextState;

  factory LogBlocTransition([void Function(LogBlocTransitionBuilder) updates]) = _$LogBlocTransition;
  LogBlocTransition._();
}

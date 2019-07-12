import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ansicolor/ansicolor.dart';

import 'package:diet_driven/blocs/logging/logging.dart';

class LoggingBloc extends Bloc<LoggingEvent, LoggingState> {
  @override
  LoggingState get initialState => LoggingState();

  // Custom print to avoid mobile phone console truncation
  // https://github.com/flutter/flutter/issues/22665#issuecomment-458186456
  void printWrapped(Object object, {int chunkSize = 800}) {
    final line = "$object";
    final pattern = RegExp(".{1,$chunkSize}");
    for (var match in pattern.allMatches(line)) {
      print(match.group(0));
    }
  }

  @override
  void onEvent(LoggingEvent event) {

  }



  @override
  void onTransition(Transition<LoggingEvent, LoggingState> transition) {
    // TODO: filter select events to remove passwords, etc
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    print("ERROR OCCURED IN LOGGING - $error");
    print(stacktrace);

    // FIXME: this only catches errors from within mapEventToState, would this catch the constructor's dispatches?
    // strait up throw errors into logging -- better to throw error as own type of log!
  }

  @override
  Stream<LoggingState> mapEventToState(LoggingEvent event) async* {
    final loggingBuilder = currentState.toBuilder();

    if (event is SendLogsToDeveloper) {
      print("SENT ${currentState.logs.length} LOGS TO DEVELOPER"); // TODO
//      return;
    }

    if (event is LogMessage) {
      final messageLog = MessageLog((b) => b
        ..message = event.message
        ..datetime = DateTime.now()
        ..level = event.level
      );

      loggingBuilder.logs.add(messageLog);
      printWrapped(messageLog);
//      final pen = AnsiPen()..white(bold: true)..rgb(r: 1.0, g: 0.8, b: 0.2);
//      print(pen("Bright white foreground") + " this text is default fg/bg");
    }

    if (event is LogError) {
      final errorLog = ErrorLog((b) => b
        ..message = event.message
        ..datetime = DateTime.now()
        ..level = event.level
        ..error = event.error
        ..stacktrace = event.stacktrace
      );

      loggingBuilder.logs.add(errorLog);
      printWrapped(errorLog);
    }

    if (event is LogBlocTransition) {

      final blocTransition = BlocTransitionLog((b) => b
        ..message = event.message
        ..datetime = DateTime.now()
        ..currentState = event.currentState
        ..event = event.event
        ..nextState = event.nextState
      );

      loggingBuilder.logs.add(blocTransition);
      printWrapped(blocTransition);

      //    logger.i("${transition.event}");
//    logger.i("${transition.event.runtimeType}");
//    logger.d("EVENT: ${transition.event}");
//    logger.d("BEFORE: ${transition.currentState}");
//    logger.d("AFTER: ${transition.nextState}\n");
//    _log.fine("");
    }

    yield loggingBuilder.build();
  }

  /// Convenience functions
  /// Instead of `LoggingBloc().dispatch(...)` for every log;

  ///
  void expectedError(String message, Object error, StackTrace stacktrace) {
    dispatch(LogError((b) => b
      ..level = ErrorLoggingLevel.expected
      ..message = message
      ..error = error
      ..stacktrace = stacktrace
    ));
  }

  ///
  void unexpectedError(String message, Object error, StackTrace stacktrace) {
    dispatch(LogError((b) => b
      ..level = ErrorLoggingLevel.unexpected
      ..message = message
      ..error = error
      ..stacktrace = stacktrace
    ));
  }

  ///
  void verbose(String message) {
    dispatch(LogMessage((b) => b
      ..level = MessageLoggingLevel.verbose
      ..message = message
    ));
  }

  ///
  void debug(String message) {
    dispatch(LogMessage((b) => b
      ..level = MessageLoggingLevel.debug
      ..message = message
    ));
  }

  ///
  void info(String message) {
    dispatch(LogMessage((b) => b
      ..level = MessageLoggingLevel.info
      ..message = message
    ));
  }

  ///
  void warning(String message) {
    dispatch(LogMessage((b) => b
      ..level = MessageLoggingLevel.warning
      ..message = message
    ));
  }

  ///
  void error(String message) {
    dispatch(LogMessage((b) => b
      ..level = MessageLoggingLevel.error
      ..message = message
    ));
  }

  /// Singleton factory
  factory LoggingBloc() => _bloc;
  static final _bloc = LoggingBloc._internal();
  LoggingBloc._internal();
}



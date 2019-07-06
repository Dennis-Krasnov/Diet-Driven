import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ansicolor/ansicolor.dart';

import 'package:diet_driven/blocs/logging/logging.dart';

class LoggingBloc extends Bloc<LoggingEvent, LoggingState> {
  @override
  LoggingState get initialState => LoggingState();


  @override
  void onEvent(LoggingEvent event) {

  }


  @override
  void onTransition(Transition<LoggingEvent, LoggingState> transition) {
    // TODO: filter select events to remove passwords, etc
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    // FIXME: this only catches errors from within mapEventToState, would this catch the constructor's dispatches?
    // strait up throw errors into logging -- better to throw error as own type of log!
  }

  @override
  Stream<LoggingState> mapEventToState(LoggingEvent event) async* {
    final loggingBuilder = currentState.toBuilder();

    if (event is SendAnonymousLogsToDeveloper) {
      print("SENT ${currentState.logs.length} LOGS TO DEVELOPER"); // TODO
      return;
    }

    if (event is LogMessage) {
      final messageLog = MessageLog((b) => b
        ..level = event.level
        ..text = event.text
        ..datetime = DateTime.now()
      );

      loggingBuilder.logs.add(messageLog);

      final pen = AnsiPen()..white(bold: true)..rgb(r: 1.0, g: 0.8, b: 0.2);
      print(pen("Bright white foreground") + " this text is default fg/bg");

      print("LOGGING MESSAGE ---");
      print(messageLog);
    }

    if (event is LogError) {
      final errorLog = ErrorLog((b) => b
        ..level = event.level
        ..error = event.error
        ..stacktrace = event.stacktrace
        ..datetime = DateTime.now()
      );

      loggingBuilder.logs.add(errorLog);
    }

    if (event is LogBlocTransition) {
      final blocTransition = BlocTransitionLog((b) => b
        ..currentState = event.currentState
        ..event = event.event
        ..nextState = event.nextState
        ..datetime = DateTime.now()
      );

      loggingBuilder.logs.add(blocTransition);

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
  void expectedError(Object error, StackTrace stacktrace) {
    dispatch(LogError((b) => b
      ..level = ErrorLoggingLevel.expected
      ..error = error
      ..stacktrace = stacktrace
    ));
  }

  ///
  void unexpectedError(Object error, StackTrace stacktrace) {
    dispatch(LogError((b) => b
      ..level = ErrorLoggingLevel.unexpected
      ..error = error
      ..stacktrace = stacktrace
    ));
  }

  ///
  void verbose(String text) {
    dispatch(LogMessage((b) => b
      ..level = MessageLoggingLevel.verbose
      ..text = text
    ));
  }

  ///
  void debug(String text) {
    dispatch(LogMessage((b) => b
      ..level = MessageLoggingLevel.debug
      ..text = text
    ));
  }

  ///
  void info(String text) {
    dispatch(LogMessage((b) => b
      ..level = MessageLoggingLevel.info
      ..text = text
    ));
  }

  ///
  void warning(String text) {
    dispatch(LogMessage((b) => b
      ..level = MessageLoggingLevel.warning
      ..text = text
    ));
  }

  ///
  void error(String text) {
    dispatch(LogMessage((b) => b
      ..level = MessageLoggingLevel.error
      ..text = text
    ));
  }

  /// Singleton factory
  factory LoggingBloc() => _bloc;
  static final _bloc = LoggingBloc._internal();
  LoggingBloc._internal();
}



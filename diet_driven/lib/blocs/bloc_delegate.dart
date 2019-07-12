import 'package:bloc/bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

/// Middleware to log transitions and errors from all blocs.
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    // Prevent recursion
    if (bloc is! LoggingBloc) {
      LoggingBloc().dispatch(LogBlocTransition((b) => b
        ..message = bloc.runtimeType.toString()
        ..currentState = transition.currentState
        ..event = transition.event
        ..nextState = transition.nextState
      ));
    }
  }

  @override
  void onError(Bloc bloc, Object error, Object stacktrace) {
    super.onError(bloc, error, stacktrace);

    // Prevent recursion
    if (bloc is! LoggingBloc) {
      LoggingBloc().unexpectedError("${bloc.runtimeType} error", error, stacktrace);
    }
  }
}

import 'package:bloc/bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';


class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    // Prevent recursion
    if (bloc is! LoggingBloc) {
      LoggingBloc().dispatch(LogBlocTransition((b) => b
//      ..blocName = bloc.runtimeType
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
      LoggingBloc().unexpectedError(error, stacktrace);
    }
  }
}

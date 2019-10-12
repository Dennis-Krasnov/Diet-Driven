/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:bloc/bloc.dart';
import 'package:bloc_logging/bloc_logging.dart';

/// Middleware to log transitions and errors from all blocs.
class LoggingBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    BlocLogger().blocEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    BlocLogger().blocTransition(bloc, transition.currentState, transition.event, transition.nextState);
  }

  @override
  void onError(Bloc bloc, Object error, Object stacktrace) {
    super.onError(bloc, error, stacktrace);
    BlocLogger().unexpectedError("${bloc.runtimeType} delegate error", error, stacktrace);
  }
}

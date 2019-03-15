import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';


class SimpleBlocDelegate extends BlocDelegate {
  final Logger _log = new Logger("BLOC");

  @override
  void onTransition(Transition transition) {
    _log.info("EVENT: ${transition.event}");
    _log.fine("BEFORE: ${transition.currentState}");
    _log.fine("AFTER: ${transition.nextState}");
    _log.fine("====================");
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _log.severe(error);
  }
}
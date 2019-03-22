import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';


class SimpleBlocDelegate extends BlocDelegate {
  final Logger _log = new Logger("BloC delegate");

  @override
  void onTransition(Transition transition) {
    _log.fine("");
    _log.fine("////////////////////");
    _log.info("${transition.event}");
    _log.fine("BEFORE: ${transition.currentState}");
    _log.fine("AFTER: ${transition.nextState}");
    _log.fine("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
    _log.fine("");
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _log.severe(error);
  }
}

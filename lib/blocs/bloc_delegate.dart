import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';


class SimpleBlocDelegate extends BlocDelegate {
  final Logger _log = new Logger("BloC delegate");

  @override
  void onTransition(Transition transition) {
//    _log.fine("");
    _log.finest("////////////////////");
    _log.info("${transition.event}");
    _log.finest("BEFORE: ${transition.currentState}");
    _log.finest("AFTER: ${transition.nextState}");
    _log.finest("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
//    _log.fine("");
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _log.severe(error);
  }
}

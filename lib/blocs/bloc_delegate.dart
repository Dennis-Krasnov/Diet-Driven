import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';


class SimpleBlocDelegate extends BlocDelegate {
  final Logger _log = Logger("BloC delegate");

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
//    _log.fine("");
    _log.finest("////////////////////");
    _log.info("${transition.event}");
    _log.finest("BEFORE: ${transition.currentState}");
    _log.finest("AFTER: ${transition.nextState}");
    _log.finest("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
//    _log.fine("");
  }

  @override
  void onError(Bloc bloc, Object error, Object stacktrace) {
    super.onError(bloc, error, stacktrace);
    _log.severe(error);
  }
}

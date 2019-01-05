import 'dart:async';
import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';
import 'package:rxdart/rxdart.dart';

typedef Observable Epic<V extends Built<V, B>, B extends Builder<V, B>,
    A extends ReduxActions>(Observable<Action<dynamic>> action, MiddlewareApi<V, B, A> mwApi);

Middleware<V, B, A> createEpicMiddleware<
    V extends Built<V, B>,
    B extends Builder<V, B>,
    A extends ReduxActions>(Iterable<Epic<V, B, A>> epics) {
  final StreamController<Action<dynamic>> _actions =
      StreamController.broadcast(sync: true);
  final StreamController<Epic<V, B, A>> _epics =
      StreamController.broadcast(sync: true);

  var _isSubscribed = false;
  final Epic<V, B, A> combined =
      (Observable<Action<dynamic>> action, MiddlewareApi<V, B, A> mwApi) {
    return Observable<dynamic>.merge(epics.map((epic) => epic(action, mwApi)));
  };

  return (MiddlewareApi<V, B, A> mwApi) => (next) => (action) {
        if (!_isSubscribed) {
          _epics.stream
              .transform<dynamic>(
                  SwitchMapStreamTransformer<Epic<V, B, A>, dynamic>(
                      (epic) => epic(Observable(_actions.stream), mwApi)))
//              .listen((dynamic _) => next(action));
              .listen((dynamic _) => null);

          _epics.add(combined);

          _isSubscribed = true;
        }

        next(action);
        _actions.add(action);
      };
}

typedef Observable EpicHandler<
    V extends Built<V, B>,
    B extends Builder<V, B>,
    A extends ReduxActions,
    P>(Observable<Action<P>> stream, MiddlewareApi<V, B, A> mwApi);

class EpicBuilder<V extends Built<V, B>, B extends Builder<V, B>,
    A extends ReduxActions> {
  final _epics = List<Epic<V, B, A>>();

  void add<T>(ActionName<T> actionName, EpicHandler<V, B, A, T> handler) {
    _epics.add((Observable<Action<dynamic>> action,
            MiddlewareApi<V, B, A> mwApi) =>
        handler(
            action.where((a) => a.name == actionName.name).cast<Action<T>>(),
            mwApi));
  }

  Iterable<Epic<V, B, A>> build() => _epics;
}

//import 'dart:async';
//
//import 'package:built_redux/built_redux.dart';
//import 'package:built_redux_rx/built_redux_rx.dart';
//import 'package:test/test.dart';
//import 'package:rxdart/rxdart.dart';
//
//import 'test_counter.dart';
//
//void main() {
//  group('redux', () {
//    Store<Counter, CounterBuilder, CounterActions> store;
//    setup(Middleware<Counter, CounterBuilder, CounterActions> middleware) {
//      var actions = new CounterActions();
//      var defaultValue = new Counter();
//
//      store = new Store(
//        createReducer(),
//        defaultValue,
//        actions,
//        middleware: [middleware],
//      );
//    }
//
//    tearDown(() {
//      store.dispose();
//    });
//
//    test('normal epics', () async {
//      final middleware =
//          createEpicMiddleware(<Epic<Counter, CounterBuilder, CounterActions>>[
//        asyncIncrement,
//        asyncDecrement,
//      ]);
//
//      setup(middleware);
//
//      store.actions.incrementAsync(3);
//      var stateChange = await store.stream.first;
//      expect(stateChange.prev.count, 1);
//      expect(stateChange.next.count, 4);
//
//      store.actions.decrementAsync(2);
//      stateChange = await store.stream.first;
//      expect(stateChange.prev.count, 4);
//      expect(stateChange.next.count, 2);
//    });
//
//    test('epic builder', () async {
//      final middleware = createEpicMiddleware(createEpicBuilder());
//
//      setup(middleware);
//
//      store.actions.incrementAsync(3);
//      var stateChange = await store.stream.first;
//      expect(stateChange.prev.count, 1);
//      expect(stateChange.next.count, 4);
//
//      store.actions.decrementAsync(2);
//      stateChange = await store.stream.first;
//      expect(stateChange.prev.count, 4);
//      expect(stateChange.next.count, 2);
//    });
//  });
//}
//
//Observable<void> asyncIncrement(Observable<Action<dynamic>> stream,
//        MiddlewareApi<Counter, CounterBuilder, CounterActions> mwApi) =>
//    stream
//        .where((a) => a.name == CounterActionsNames.incrementAsync.name)
//        .map((a) => a as Action<int>)
//        .asyncMap<void>(
//          (action) => new Future<void>.delayed(new Duration(milliseconds: 1))
//              .then((_) => mwApi.actions.increment(action.payload)),
//        );
//
//Observable<void> asyncDecrement(Observable<Action<dynamic>> stream,
//        MiddlewareApi<Counter, CounterBuilder, CounterActions> mwApi) =>
//    stream
//        .where((a) => a.name == CounterActionsNames.decrementAsync.name)
//        .map((a) => a as Action<int>)
//        .asyncMap(
//          (action) => new Future<void>.delayed(new Duration(milliseconds: 1))
//              .then((_) => mwApi.actions.decrement(action.payload)),
//        );
//
//Iterable<Epic<Counter, CounterBuilder, CounterActions>> createEpicBuilder() =>
//    (new EpicBuilder<Counter, CounterBuilder, CounterActions>()
//          ..add(CounterActionsNames.incrementAsync, asyncIncrementBuilder)
//          ..add(CounterActionsNames.decrementAsync, asyncDecrementBuilder))
//        .build();
//
//Observable<void> asyncIncrementBuilder(Observable<Action<int>> stream,
//        MiddlewareApi<Counter, CounterBuilder, CounterActions> mwApi) =>
//    stream.asyncMap(
//      (action) => new Future<void>.delayed(new Duration(milliseconds: 1))
//          .then((_) => mwApi.actions.increment(action.payload)),
//    );
//
//Observable<void> asyncDecrementBuilder(Observable<Action<int>> stream,
//        MiddlewareApi<Counter, CounterBuilder, CounterActions> mwApi) =>
//    stream.asyncMap(
//      (action) => new Future<void>.delayed(new Duration(milliseconds: 1))
//          .then((_) => mwApi.actions.decrement(action.payload)),
//    );

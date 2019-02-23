## Rx

By adding the rx middleware to any of your built_redux stores, one can register side-effects, or epics, to run on any action. Epics provide a clean way to perform async operations in response to actions.

### Example

Create a function that listens to the action stream and makes an http request
on actions with the name CounterActionsNames.fetchData

```dart
Observable httpRequestEpic(Observable<Action<dynamic>> stream,
        MiddlewareApi<Counter, CounterBuilder, CounterActions> mwApi) =>
    stream
        .where((a) => a.name == CounterActionsNames.fetchData)
        .map((a) => a as Action<String>)
        .asyncMap(
          (action) => HttpRequest
            .getString(action.payload)
            .then(api.actions.onRequestResolved),
        );
```

```dart
var store = new Store<Counter, CounterBuilder, CounterActions>(
  createReducer(),
  new Counter(),
  new CounterActions(),
  middleware: <Middleware<TestCounter, TestCounterBuilder, TestCounterActions>>[
    createEpicMiddleware([httpRequestEpic]),
  ],
);
```

Dispatch the action

```dart
store.actions.fetchData('http://example.com/');
```

### EpicBuilder

EpicBuilder lets you map a given action to an epic thats action stream
is one that only fires on the given action. The payload of the action stream is typed!

Write the epic, notice the generic of Action is String.
```dart
Observable httpRequestEpic(Observable<Action<String>> stream,
        MiddlewareApi<Counter, CounterBuilder, CounterActions> mwApi) =>
    stream
        .asyncMap(
          (action) => HttpRequest
            .getString(action.payload)
            .then(api.actions.onRequestResolved),
        );
```

Write an Epic builder.
```dart
Iterable<Epic<Counter, CounterBuilder, CounterActions>> createEpicBuilder() =>
    (new EpicBuilder<Counter, CounterBuilder, CounterActions>()
          ..add(CounterActionsNames.fetchData, httpRequestEpic)
        .build();

```

```dart
var store = new Store<Counter, CounterBuilder, CounterActions>(
  createReducer(),
  new Counter(),
  new CounterActions(),
  middleware: <Middleware<TestCounter, TestCounterBuilder, TestCounterActions>>[
    createEpicMiddleware([httpRequestEpic]),
  ],
);
```

Dispatch the action

```dart
store.actions.fetchData('http://example.com/');
```

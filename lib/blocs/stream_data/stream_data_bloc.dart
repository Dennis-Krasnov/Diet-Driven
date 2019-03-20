import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:diet_driven/blocs/stream_data/stream_data.dart';
import 'package:rxdart/rxdart.dart';

class StreamDataBloc<T> extends Bloc<StreamDataEvent, StreamDataState> {
  StreamSubscription<T> subscription;

  @override
  StreamDataState get initialState => StreamDataNone();

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Stream<StreamDataState> mapEventToState(StreamDataState currentState, StreamDataEvent event) async* {
    if (event is StreamDataInit<T>) {
      subscription = event.stream.listen(
        (data) => this.dispatch(StreamDataArrived<T>((b) => b..data = data)),
        onError: (error, stacktrace) => this.dispatch(StreamErrorArrived()), // TODO: take arguments
        onDone: () => this.dispatch(StreamDoneArrived())
      );
      yield StreamDataWaiting();
    }
    if (event is StreamDataArrived<T>) {
      if (currentState is StreamDataWaiting || currentState is StreamDataActive<T>) {
        yield StreamDataActive<T>((b) => b..data = event.data);
      } else {
        print("can't take until until stream data is waiting or loaded. data: ${event.data}");
      }
    }
    if (event is StreamErrorArrived) {
      print("ERROR ARRIVED: $event");
    }
    if (event is StreamDoneArrived) {
      yield StreamDataDone();
    }
    // TODO: pause and resume events!?
//    subscription.pause()
//    subscription.resume()
  }
}
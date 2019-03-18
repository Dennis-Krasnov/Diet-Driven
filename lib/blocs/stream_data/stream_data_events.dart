import 'package:built_value/built_value.dart';
import 'package:rxdart/rxdart.dart';

part 'stream_data_events.g.dart';

abstract class StreamDataEvent {}

abstract class StreamDataArrived<T> with StreamDataEvent implements Built<StreamDataArrived<T>, StreamDataArrivedBuilder<T>> {
  T get data;

  StreamDataArrived._();
  factory StreamDataArrived([updates(StreamDataArrivedBuilder<T> b)]) = _$StreamDataArrived<T>;
}

// TODO: create snippet for generic built value, snippet for built builder
// see thread for android studio bloc snippets!

abstract class StreamDataInit<T> with StreamDataEvent implements Built<StreamDataInit<T>, StreamDataInitBuilder<T>> {
  ValueObservable<T> get stream;

  StreamDataInit._();
  factory StreamDataInit([updates(StreamDataInitBuilder<T> b)]) = _$StreamDataInit<T>;
}

// TODO: pause/play/cancel event!
//abstract class StreamDataDispose with StreamDataEvent implements Built<StreamDataDispose, StreamDataDisposeBuilder> {
//  StreamDataDispose._();
//  factory StreamDataDispose([updates(StreamDataDisposeBuilder b)]) = _$StreamDataDispose;
//}

abstract class StreamErrorArrived with StreamDataEvent implements Built<StreamErrorArrived, StreamErrorArrivedBuilder> {
  StreamErrorArrived._();
  factory StreamErrorArrived([updates(StreamErrorArrivedBuilder b)]) = _$StreamErrorArrived;
}

abstract class StreamDoneArrived with StreamDataEvent implements Built<StreamDoneArrived, StreamDoneArrivedBuilder> {
  StreamDoneArrived._();
  factory StreamDoneArrived([updates(StreamDoneArrivedBuilder b)]) = _$StreamDoneArrived;
}
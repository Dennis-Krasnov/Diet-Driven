import 'package:built_value/built_value.dart';
import 'package:rxdart/rxdart.dart';

part 'stream_data_state.g.dart';

// Mirrors ConnectionState enum
abstract class StreamDataState {}

abstract class StreamDataNone with StreamDataState implements Built<StreamDataNone, StreamDataNoneBuilder> {
  StreamDataNone._();
  factory StreamDataNone([updates(StreamDataNoneBuilder b)]) = _$StreamDataNone;
}

abstract class StreamDataWaiting with StreamDataState implements Built<StreamDataWaiting, StreamDataWaitingBuilder> {
  StreamDataWaiting._();
  factory StreamDataWaiting([updates(StreamDataWaitingBuilder b)]) = _$StreamDataWaiting;
}

abstract class StreamDataActive<T> with StreamDataState implements Built<StreamDataActive<T>, StreamDataActiveBuilder<T>> {
  T get data;

  StreamDataActive._();
  factory StreamDataActive([updates(StreamDataActiveBuilder<T> b)]) = _$StreamDataActive<T>;
}

abstract class StreamDataDone with StreamDataState implements Built<StreamDataDone, StreamDataDoneBuilder> {
  StreamDataDone._();
  factory StreamDataDone([updates(StreamDataDoneBuilder b)]) = _$StreamDataDone;
}

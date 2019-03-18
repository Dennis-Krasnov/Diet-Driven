// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_data_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StreamDataArrived<T> extends StreamDataArrived<T> {
  @override
  final T data;

  factory _$StreamDataArrived([void updates(StreamDataArrivedBuilder<T> b)]) =>
      (new StreamDataArrivedBuilder<T>()..update(updates)).build();

  _$StreamDataArrived._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('StreamDataArrived', 'data');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('StreamDataArrived', 'T');
    }
  }

  @override
  StreamDataArrived<T> rebuild(void updates(StreamDataArrivedBuilder<T> b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamDataArrivedBuilder<T> toBuilder() =>
      new StreamDataArrivedBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamDataArrived && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StreamDataArrived')..add('data', data))
        .toString();
  }
}

class StreamDataArrivedBuilder<T>
    implements Builder<StreamDataArrived<T>, StreamDataArrivedBuilder<T>> {
  _$StreamDataArrived<T> _$v;

  T _data;
  T get data => _$this._data;
  set data(T data) => _$this._data = data;

  StreamDataArrivedBuilder();

  StreamDataArrivedBuilder<T> get _$this {
    if (_$v != null) {
      _data = _$v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StreamDataArrived<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StreamDataArrived<T>;
  }

  @override
  void update(void updates(StreamDataArrivedBuilder<T> b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StreamDataArrived<T> build() {
    final _$result = _$v ?? new _$StreamDataArrived<T>._(data: data);
    replace(_$result);
    return _$result;
  }
}

class _$StreamDataInit<T> extends StreamDataInit<T> {
  @override
  final ValueObservable<T> stream;

  factory _$StreamDataInit([void updates(StreamDataInitBuilder<T> b)]) =>
      (new StreamDataInitBuilder<T>()..update(updates)).build();

  _$StreamDataInit._({this.stream}) : super._() {
    if (stream == null) {
      throw new BuiltValueNullFieldError('StreamDataInit', 'stream');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('StreamDataInit', 'T');
    }
  }

  @override
  StreamDataInit<T> rebuild(void updates(StreamDataInitBuilder<T> b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamDataInitBuilder<T> toBuilder() =>
      new StreamDataInitBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamDataInit && stream == other.stream;
  }

  @override
  int get hashCode {
    return $jf($jc(0, stream.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StreamDataInit')
          ..add('stream', stream))
        .toString();
  }
}

class StreamDataInitBuilder<T>
    implements Builder<StreamDataInit<T>, StreamDataInitBuilder<T>> {
  _$StreamDataInit<T> _$v;

  ValueObservable<T> _stream;
  ValueObservable<T> get stream => _$this._stream;
  set stream(ValueObservable<T> stream) => _$this._stream = stream;

  StreamDataInitBuilder();

  StreamDataInitBuilder<T> get _$this {
    if (_$v != null) {
      _stream = _$v.stream;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StreamDataInit<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StreamDataInit<T>;
  }

  @override
  void update(void updates(StreamDataInitBuilder<T> b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StreamDataInit<T> build() {
    final _$result = _$v ?? new _$StreamDataInit<T>._(stream: stream);
    replace(_$result);
    return _$result;
  }
}

class _$StreamErrorArrived extends StreamErrorArrived {
  factory _$StreamErrorArrived([void updates(StreamErrorArrivedBuilder b)]) =>
      (new StreamErrorArrivedBuilder()..update(updates)).build();

  _$StreamErrorArrived._() : super._();

  @override
  StreamErrorArrived rebuild(void updates(StreamErrorArrivedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamErrorArrivedBuilder toBuilder() =>
      new StreamErrorArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamErrorArrived;
  }

  @override
  int get hashCode {
    return 359024230;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('StreamErrorArrived').toString();
  }
}

class StreamErrorArrivedBuilder
    implements Builder<StreamErrorArrived, StreamErrorArrivedBuilder> {
  _$StreamErrorArrived _$v;

  StreamErrorArrivedBuilder();

  @override
  void replace(StreamErrorArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StreamErrorArrived;
  }

  @override
  void update(void updates(StreamErrorArrivedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StreamErrorArrived build() {
    final _$result = _$v ?? new _$StreamErrorArrived._();
    replace(_$result);
    return _$result;
  }
}

class _$StreamDoneArrived extends StreamDoneArrived {
  factory _$StreamDoneArrived([void updates(StreamDoneArrivedBuilder b)]) =>
      (new StreamDoneArrivedBuilder()..update(updates)).build();

  _$StreamDoneArrived._() : super._();

  @override
  StreamDoneArrived rebuild(void updates(StreamDoneArrivedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamDoneArrivedBuilder toBuilder() =>
      new StreamDoneArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamDoneArrived;
  }

  @override
  int get hashCode {
    return 245942203;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('StreamDoneArrived').toString();
  }
}

class StreamDoneArrivedBuilder
    implements Builder<StreamDoneArrived, StreamDoneArrivedBuilder> {
  _$StreamDoneArrived _$v;

  StreamDoneArrivedBuilder();

  @override
  void replace(StreamDoneArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StreamDoneArrived;
  }

  @override
  void update(void updates(StreamDoneArrivedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StreamDoneArrived build() {
    final _$result = _$v ?? new _$StreamDoneArrived._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

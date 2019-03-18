// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_data_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StreamDataNone extends StreamDataNone {
  factory _$StreamDataNone([void updates(StreamDataNoneBuilder b)]) =>
      (new StreamDataNoneBuilder()..update(updates)).build();

  _$StreamDataNone._() : super._();

  @override
  StreamDataNone rebuild(void updates(StreamDataNoneBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamDataNoneBuilder toBuilder() =>
      new StreamDataNoneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamDataNone;
  }

  @override
  int get hashCode {
    return 515302227;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('StreamDataNone').toString();
  }
}

class StreamDataNoneBuilder
    implements Builder<StreamDataNone, StreamDataNoneBuilder> {
  _$StreamDataNone _$v;

  StreamDataNoneBuilder();

  @override
  void replace(StreamDataNone other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StreamDataNone;
  }

  @override
  void update(void updates(StreamDataNoneBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StreamDataNone build() {
    final _$result = _$v ?? new _$StreamDataNone._();
    replace(_$result);
    return _$result;
  }
}

class _$StreamDataWaiting extends StreamDataWaiting {
  factory _$StreamDataWaiting([void updates(StreamDataWaitingBuilder b)]) =>
      (new StreamDataWaitingBuilder()..update(updates)).build();

  _$StreamDataWaiting._() : super._();

  @override
  StreamDataWaiting rebuild(void updates(StreamDataWaitingBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamDataWaitingBuilder toBuilder() =>
      new StreamDataWaitingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamDataWaiting;
  }

  @override
  int get hashCode {
    return 904023097;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('StreamDataWaiting').toString();
  }
}

class StreamDataWaitingBuilder
    implements Builder<StreamDataWaiting, StreamDataWaitingBuilder> {
  _$StreamDataWaiting _$v;

  StreamDataWaitingBuilder();

  @override
  void replace(StreamDataWaiting other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StreamDataWaiting;
  }

  @override
  void update(void updates(StreamDataWaitingBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StreamDataWaiting build() {
    final _$result = _$v ?? new _$StreamDataWaiting._();
    replace(_$result);
    return _$result;
  }
}

class _$StreamDataActive<T> extends StreamDataActive<T> {
  @override
  final T data;

  factory _$StreamDataActive([void updates(StreamDataActiveBuilder<T> b)]) =>
      (new StreamDataActiveBuilder<T>()..update(updates)).build();

  _$StreamDataActive._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('StreamDataActive', 'data');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('StreamDataActive', 'T');
    }
  }

  @override
  StreamDataActive<T> rebuild(void updates(StreamDataActiveBuilder<T> b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamDataActiveBuilder<T> toBuilder() =>
      new StreamDataActiveBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamDataActive && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StreamDataActive')..add('data', data))
        .toString();
  }
}

class StreamDataActiveBuilder<T>
    implements Builder<StreamDataActive<T>, StreamDataActiveBuilder<T>> {
  _$StreamDataActive<T> _$v;

  T _data;
  T get data => _$this._data;
  set data(T data) => _$this._data = data;

  StreamDataActiveBuilder();

  StreamDataActiveBuilder<T> get _$this {
    if (_$v != null) {
      _data = _$v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StreamDataActive<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StreamDataActive<T>;
  }

  @override
  void update(void updates(StreamDataActiveBuilder<T> b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StreamDataActive<T> build() {
    final _$result = _$v ?? new _$StreamDataActive<T>._(data: data);
    replace(_$result);
    return _$result;
  }
}

class _$StreamDataDone extends StreamDataDone {
  factory _$StreamDataDone([void updates(StreamDataDoneBuilder b)]) =>
      (new StreamDataDoneBuilder()..update(updates)).build();

  _$StreamDataDone._() : super._();

  @override
  StreamDataDone rebuild(void updates(StreamDataDoneBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamDataDoneBuilder toBuilder() =>
      new StreamDataDoneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamDataDone;
  }

  @override
  int get hashCode {
    return 845742206;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('StreamDataDone').toString();
  }
}

class StreamDataDoneBuilder
    implements Builder<StreamDataDone, StreamDataDoneBuilder> {
  _$StreamDataDone _$v;

  StreamDataDoneBuilder();

  @override
  void replace(StreamDataDone other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StreamDataDone;
  }

  @override
  void update(void updates(StreamDataDoneBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StreamDataDone build() {
    final _$result = _$v ?? new _$StreamDataDone._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_record_edit_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateQuantity extends UpdateQuantity {
  @override
  final num grams;

  factory _$UpdateQuantity([void Function(UpdateQuantityBuilder) updates]) =>
      (new UpdateQuantityBuilder()..update(updates)).build();

  _$UpdateQuantity._({this.grams}) : super._() {
    if (grams == null) {
      throw new BuiltValueNullFieldError('UpdateQuantity', 'grams');
    }
  }

  @override
  UpdateQuantity rebuild(void Function(UpdateQuantityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateQuantityBuilder toBuilder() =>
      new UpdateQuantityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateQuantity && grams == other.grams;
  }

  @override
  int get hashCode {
    return $jf($jc(0, grams.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateQuantity')..add('grams', grams))
        .toString();
  }
}

class UpdateQuantityBuilder
    implements Builder<UpdateQuantity, UpdateQuantityBuilder> {
  _$UpdateQuantity _$v;

  num _grams;
  num get grams => _$this._grams;
  set grams(num grams) => _$this._grams = grams;

  UpdateQuantityBuilder();

  UpdateQuantityBuilder get _$this {
    if (_$v != null) {
      _grams = _$v.grams;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateQuantity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateQuantity;
  }

  @override
  void update(void Function(UpdateQuantityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateQuantity build() {
    final _$result = _$v ?? new _$UpdateQuantity._(grams: grams);
    replace(_$result);
    return _$result;
  }
}

class _$DeleteFoodRecord extends DeleteFoodRecord {
  @override
  final Completer<void> completer;

  factory _$DeleteFoodRecord(
          [void Function(DeleteFoodRecordBuilder) updates]) =>
      (new DeleteFoodRecordBuilder()..update(updates)).build();

  _$DeleteFoodRecord._({this.completer}) : super._();

  @override
  DeleteFoodRecord rebuild(void Function(DeleteFoodRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteFoodRecordBuilder toBuilder() =>
      new DeleteFoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteFoodRecord && completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc(0, completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeleteFoodRecord')
          ..add('completer', completer))
        .toString();
  }
}

class DeleteFoodRecordBuilder
    implements Builder<DeleteFoodRecord, DeleteFoodRecordBuilder> {
  _$DeleteFoodRecord _$v;

  Completer<void> _completer;
  Completer<void> get completer => _$this._completer;
  set completer(Completer<void> completer) => _$this._completer = completer;

  DeleteFoodRecordBuilder();

  DeleteFoodRecordBuilder get _$this {
    if (_$v != null) {
      _completer = _$v.completer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteFoodRecord other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeleteFoodRecord;
  }

  @override
  void update(void Function(DeleteFoodRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeleteFoodRecord build() {
    final _$result = _$v ?? new _$DeleteFoodRecord._(completer: completer);
    replace(_$result);
    return _$result;
  }
}

class _$SaveFoodRecord extends SaveFoodRecord {
  factory _$SaveFoodRecord([void Function(SaveFoodRecordBuilder) updates]) =>
      (new SaveFoodRecordBuilder()..update(updates)).build();

  _$SaveFoodRecord._() : super._();

  @override
  SaveFoodRecord rebuild(void Function(SaveFoodRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveFoodRecordBuilder toBuilder() =>
      new SaveFoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveFoodRecord;
  }

  @override
  int get hashCode {
    return 921753263;
  }
}

class SaveFoodRecordBuilder
    implements Builder<SaveFoodRecord, SaveFoodRecordBuilder> {
  _$SaveFoodRecord _$v;

  SaveFoodRecordBuilder();

  @override
  void replace(SaveFoodRecord other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SaveFoodRecord;
  }

  @override
  void update(void Function(SaveFoodRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SaveFoodRecord build() {
    final _$result = _$v ?? new _$SaveFoodRecord._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

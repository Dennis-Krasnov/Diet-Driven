// GENERATED CODE - DO NOT MODIFY BY HAND

part of goals_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GoalsPageVM extends GoalsPageVM {
  @override
  final BuiltSetMultimap<FS, int> subscriptions;

  factory _$GoalsPageVM([void updates(GoalsPageVMBuilder b)]) =>
      (new GoalsPageVMBuilder()..update(updates)).build();

  _$GoalsPageVM._({this.subscriptions}) : super._() {
    if (subscriptions == null) {
      throw new BuiltValueNullFieldError('GoalsPageVM', 'subscriptions');
    }
  }

  @override
  GoalsPageVM rebuild(void updates(GoalsPageVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GoalsPageVMBuilder toBuilder() => new GoalsPageVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoalsPageVM && subscriptions == other.subscriptions;
  }

  @override
  int get hashCode {
    return $jf($jc(0, subscriptions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GoalsPageVM')
          ..add('subscriptions', subscriptions))
        .toString();
  }
}

class GoalsPageVMBuilder implements Builder<GoalsPageVM, GoalsPageVMBuilder> {
  _$GoalsPageVM _$v;

  SetMultimapBuilder<FS, int> _subscriptions;
  SetMultimapBuilder<FS, int> get subscriptions =>
      _$this._subscriptions ??= new SetMultimapBuilder<FS, int>();
  set subscriptions(SetMultimapBuilder<FS, int> subscriptions) =>
      _$this._subscriptions = subscriptions;

  GoalsPageVMBuilder();

  GoalsPageVMBuilder get _$this {
    if (_$v != null) {
      _subscriptions = _$v.subscriptions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GoalsPageVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GoalsPageVM;
  }

  @override
  void update(void updates(GoalsPageVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GoalsPageVM build() {
    _$GoalsPageVM _$result;
    try {
      _$result =
          _$v ?? new _$GoalsPageVM._(subscriptions: subscriptions.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'subscriptions';
        subscriptions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GoalsPageVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

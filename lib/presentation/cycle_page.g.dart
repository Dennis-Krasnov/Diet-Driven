// GENERATED CODE - DO NOT MODIFY BY HAND

part of cycle_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CyclePageVM extends CyclePageVM {
  @override
  final Map<Connection, List<int>> subscriptions;
  @override
  final BuiltList<int> widgets;

  factory _$CyclePageVM([void updates(CyclePageVMBuilder b)]) =>
      (new CyclePageVMBuilder()..update(updates)).build();

  _$CyclePageVM._({this.subscriptions, this.widgets}) : super._() {
    if (subscriptions == null) {
      throw new BuiltValueNullFieldError('CyclePageVM', 'subscriptions');
    }
    if (widgets == null) {
      throw new BuiltValueNullFieldError('CyclePageVM', 'widgets');
    }
  }

  @override
  CyclePageVM rebuild(void updates(CyclePageVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CyclePageVMBuilder toBuilder() => new CyclePageVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CyclePageVM &&
        subscriptions == other.subscriptions &&
        widgets == other.widgets;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, subscriptions.hashCode), widgets.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CyclePageVM')
          ..add('subscriptions', subscriptions)
          ..add('widgets', widgets))
        .toString();
  }
}

class CyclePageVMBuilder implements Builder<CyclePageVM, CyclePageVMBuilder> {
  _$CyclePageVM _$v;

  Map<Connection, List<int>> _subscriptions;
  Map<Connection, List<int>> get subscriptions => _$this._subscriptions;
  set subscriptions(Map<Connection, List<int>> subscriptions) =>
      _$this._subscriptions = subscriptions;

  ListBuilder<int> _widgets;
  ListBuilder<int> get widgets => _$this._widgets ??= new ListBuilder<int>();
  set widgets(ListBuilder<int> widgets) => _$this._widgets = widgets;

  CyclePageVMBuilder();

  CyclePageVMBuilder get _$this {
    if (_$v != null) {
      _subscriptions = _$v.subscriptions;
      _widgets = _$v.widgets?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CyclePageVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CyclePageVM;
  }

  @override
  void update(void updates(CyclePageVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CyclePageVM build() {
    _$CyclePageVM _$result;
    try {
      _$result = _$v ??
          new _$CyclePageVM._(
              subscriptions: subscriptions, widgets: widgets.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'widgets';
        widgets.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CyclePageVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

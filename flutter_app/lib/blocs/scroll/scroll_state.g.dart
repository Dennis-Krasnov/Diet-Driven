// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scroll_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ScrollState extends ScrollState {
  @override
  final int currentScrollIndex;
  @override
  final double scrollPercentage;

  factory _$ScrollState([void Function(ScrollStateBuilder) updates]) =>
      (new ScrollStateBuilder()..update(updates)).build();

  _$ScrollState._({this.currentScrollIndex, this.scrollPercentage})
      : super._() {
    if (currentScrollIndex == null) {
      throw new BuiltValueNullFieldError('ScrollState', 'currentScrollIndex');
    }
    if (scrollPercentage == null) {
      throw new BuiltValueNullFieldError('ScrollState', 'scrollPercentage');
    }
  }

  @override
  ScrollState rebuild(void Function(ScrollStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScrollStateBuilder toBuilder() => new ScrollStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScrollState &&
        currentScrollIndex == other.currentScrollIndex &&
        scrollPercentage == other.scrollPercentage;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, currentScrollIndex.hashCode), scrollPercentage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ScrollState')
          ..add('currentScrollIndex', currentScrollIndex)
          ..add('scrollPercentage', scrollPercentage))
        .toString();
  }
}

class ScrollStateBuilder implements Builder<ScrollState, ScrollStateBuilder> {
  _$ScrollState _$v;

  int _currentScrollIndex;
  int get currentScrollIndex => _$this._currentScrollIndex;
  set currentScrollIndex(int currentScrollIndex) =>
      _$this._currentScrollIndex = currentScrollIndex;

  double _scrollPercentage;
  double get scrollPercentage => _$this._scrollPercentage;
  set scrollPercentage(double scrollPercentage) =>
      _$this._scrollPercentage = scrollPercentage;

  ScrollStateBuilder();

  ScrollStateBuilder get _$this {
    if (_$v != null) {
      _currentScrollIndex = _$v.currentScrollIndex;
      _scrollPercentage = _$v.scrollPercentage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScrollState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ScrollState;
  }

  @override
  void update(void Function(ScrollStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ScrollState build() {
    final _$result = _$v ??
        new _$ScrollState._(
            currentScrollIndex: currentScrollIndex,
            scrollPercentage: scrollPercentage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

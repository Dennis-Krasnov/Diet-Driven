// GENERATED CODE - DO NOT MODIFY BY HAND

part of diet_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DietPageVM extends DietPageVM {
  @override
  final List<Page> pages;

  factory _$DietPageVM([void updates(DietPageVMBuilder b)]) =>
      (new DietPageVMBuilder()..update(updates)).build();

  _$DietPageVM._({this.pages}) : super._() {
    if (pages == null) {
      throw new BuiltValueNullFieldError('DietPageVM', 'pages');
    }
  }

  @override
  DietPageVM rebuild(void updates(DietPageVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DietPageVMBuilder toBuilder() => new DietPageVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DietPageVM && pages == other.pages;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DietPageVM')..add('pages', pages))
        .toString();
  }
}

class DietPageVMBuilder implements Builder<DietPageVM, DietPageVMBuilder> {
  _$DietPageVM _$v;

  List<Page> _pages;
  List<Page> get pages => _$this._pages;
  set pages(List<Page> pages) => _$this._pages = pages;

  DietPageVMBuilder();

  DietPageVMBuilder get _$this {
    if (_$v != null) {
      _pages = _$v.pages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DietPageVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DietPageVM;
  }

  @override
  void update(void updates(DietPageVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DietPageVM build() {
    final _$result = _$v ?? new _$DietPageVM._(pages: pages);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

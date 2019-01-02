// GENERATED CODE - DO NOT MODIFY BY HAND

part of drawer_nav;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DrawerNavigationVM extends DrawerNavigationVM {
  @override
  final List<Page> pages;

  factory _$DrawerNavigationVM([void updates(DrawerNavigationVMBuilder b)]) =>
      (new DrawerNavigationVMBuilder()..update(updates)).build();

  _$DrawerNavigationVM._({this.pages}) : super._() {
    if (pages == null) {
      throw new BuiltValueNullFieldError('DrawerNavigationVM', 'pages');
    }
  }

  @override
  DrawerNavigationVM rebuild(void updates(DrawerNavigationVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DrawerNavigationVMBuilder toBuilder() =>
      new DrawerNavigationVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DrawerNavigationVM && pages == other.pages;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DrawerNavigationVM')
          ..add('pages', pages))
        .toString();
  }
}

class DrawerNavigationVMBuilder
    implements Builder<DrawerNavigationVM, DrawerNavigationVMBuilder> {
  _$DrawerNavigationVM _$v;

  List<Page> _pages;
  List<Page> get pages => _$this._pages;
  set pages(List<Page> pages) => _$this._pages = pages;

  DrawerNavigationVMBuilder();

  DrawerNavigationVMBuilder get _$this {
    if (_$v != null) {
      _pages = _$v.pages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DrawerNavigationVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DrawerNavigationVM;
  }

  @override
  void update(void updates(DrawerNavigationVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DrawerNavigationVM build() {
    final _$result = _$v ?? new _$DrawerNavigationVM._(pages: pages);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

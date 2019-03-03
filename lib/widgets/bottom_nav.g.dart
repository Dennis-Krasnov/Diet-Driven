// GENERATED CODE - DO NOT MODIFY BY HAND

part of bottom_nav;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BottomNavigationVM extends BottomNavigationVM {
  @override
  final BuiltList<Page> pages;

  factory _$BottomNavigationVM([void updates(BottomNavigationVMBuilder b)]) =>
      (new BottomNavigationVMBuilder()..update(updates)).build();

  _$BottomNavigationVM._({this.pages}) : super._() {
    if (pages == null) {
      throw new BuiltValueNullFieldError('BottomNavigationVM', 'pages');
    }
  }

  @override
  BottomNavigationVM rebuild(void updates(BottomNavigationVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BottomNavigationVMBuilder toBuilder() =>
      new BottomNavigationVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BottomNavigationVM && pages == other.pages;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BottomNavigationVM')
          ..add('pages', pages))
        .toString();
  }
}

class BottomNavigationVMBuilder
    implements Builder<BottomNavigationVM, BottomNavigationVMBuilder> {
  _$BottomNavigationVM _$v;

  ListBuilder<Page> _pages;
  ListBuilder<Page> get pages => _$this._pages ??= new ListBuilder<Page>();
  set pages(ListBuilder<Page> pages) => _$this._pages = pages;

  BottomNavigationVMBuilder();

  BottomNavigationVMBuilder get _$this {
    if (_$v != null) {
      _pages = _$v.pages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BottomNavigationVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BottomNavigationVM;
  }

  @override
  void update(void updates(BottomNavigationVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BottomNavigationVM build() {
    _$BottomNavigationVM _$result;
    try {
      _$result = _$v ?? new _$BottomNavigationVM._(pages: pages.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pages';
        pages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BottomNavigationVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

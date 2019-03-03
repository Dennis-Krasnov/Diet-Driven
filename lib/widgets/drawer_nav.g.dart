// GENERATED CODE - DO NOT MODIFY BY HAND

part of drawer_nav;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DrawerNavigationVM extends DrawerNavigationVM {
  @override
  final BuiltList<Page> pages;
  @override
  final FirebaseUser auth;

  factory _$DrawerNavigationVM([void updates(DrawerNavigationVMBuilder b)]) =>
      (new DrawerNavigationVMBuilder()..update(updates)).build();

  _$DrawerNavigationVM._({this.pages, this.auth}) : super._() {
    if (pages == null) {
      throw new BuiltValueNullFieldError('DrawerNavigationVM', 'pages');
    }
    if (auth == null) {
      throw new BuiltValueNullFieldError('DrawerNavigationVM', 'auth');
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
    return other is DrawerNavigationVM &&
        pages == other.pages &&
        auth == other.auth;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, pages.hashCode), auth.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DrawerNavigationVM')
          ..add('pages', pages)
          ..add('auth', auth))
        .toString();
  }
}

class DrawerNavigationVMBuilder
    implements Builder<DrawerNavigationVM, DrawerNavigationVMBuilder> {
  _$DrawerNavigationVM _$v;

  ListBuilder<Page> _pages;
  ListBuilder<Page> get pages => _$this._pages ??= new ListBuilder<Page>();
  set pages(ListBuilder<Page> pages) => _$this._pages = pages;

  FirebaseUser _auth;
  FirebaseUser get auth => _$this._auth;
  set auth(FirebaseUser auth) => _$this._auth = auth;

  DrawerNavigationVMBuilder();

  DrawerNavigationVMBuilder get _$this {
    if (_$v != null) {
      _pages = _$v.pages?.toBuilder();
      _auth = _$v.auth;
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
    _$DrawerNavigationVM _$result;
    try {
      _$result =
          _$v ?? new _$DrawerNavigationVM._(pages: pages.build(), auth: auth);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pages';
        pages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DrawerNavigationVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

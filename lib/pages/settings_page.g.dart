// GENERATED CODE - DO NOT MODIFY BY HAND

part of settings_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SettingsPageVM extends SettingsPageVM {
  @override
  final BuiltList<Page> pages;
  @override
  final Page defaultPage;

  factory _$SettingsPageVM([void updates(SettingsPageVMBuilder b)]) =>
      (new SettingsPageVMBuilder()..update(updates)).build();

  _$SettingsPageVM._({this.pages, this.defaultPage}) : super._() {
    if (pages == null) {
      throw new BuiltValueNullFieldError('SettingsPageVM', 'pages');
    }
    if (defaultPage == null) {
      throw new BuiltValueNullFieldError('SettingsPageVM', 'defaultPage');
    }
  }

  @override
  SettingsPageVM rebuild(void updates(SettingsPageVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsPageVMBuilder toBuilder() =>
      new SettingsPageVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsPageVM &&
        pages == other.pages &&
        defaultPage == other.defaultPage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, pages.hashCode), defaultPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsPageVM')
          ..add('pages', pages)
          ..add('defaultPage', defaultPage))
        .toString();
  }
}

class SettingsPageVMBuilder
    implements Builder<SettingsPageVM, SettingsPageVMBuilder> {
  _$SettingsPageVM _$v;

  ListBuilder<Page> _pages;
  ListBuilder<Page> get pages => _$this._pages ??= new ListBuilder<Page>();
  set pages(ListBuilder<Page> pages) => _$this._pages = pages;

  Page _defaultPage;
  Page get defaultPage => _$this._defaultPage;
  set defaultPage(Page defaultPage) => _$this._defaultPage = defaultPage;

  SettingsPageVMBuilder();

  SettingsPageVMBuilder get _$this {
    if (_$v != null) {
      _pages = _$v.pages?.toBuilder();
      _defaultPage = _$v.defaultPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsPageVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsPageVM;
  }

  @override
  void update(void updates(SettingsPageVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsPageVM build() {
    _$SettingsPageVM _$result;
    try {
      _$result = _$v ??
          new _$SettingsPageVM._(
              pages: pages.build(), defaultPage: defaultPage);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pages';
        pages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SettingsPageVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

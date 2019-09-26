// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_links.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class DeepLinkBuilder {
  void replace(DeepLink other);
  void update(void Function(DeepLinkBuilder) updates);
  String get path;
  set path(String path);

  bool get fullPage;
  set fullPage(bool fullPage);
}

class _$PathDeepLink extends PathDeepLink {
  @override
  final String path;
  @override
  final bool fullPage;

  factory _$PathDeepLink([void Function(PathDeepLinkBuilder) updates]) =>
      (new PathDeepLinkBuilder()..update(updates)).build() as _$PathDeepLink;

  _$PathDeepLink._({this.path, this.fullPage}) : super._() {
    if (path == null) {
      throw new BuiltValueNullFieldError('PathDeepLink', 'path');
    }
    if (fullPage == null) {
      throw new BuiltValueNullFieldError('PathDeepLink', 'fullPage');
    }
  }

  @override
  PathDeepLink rebuild(void Function(PathDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$PathDeepLinkBuilder toBuilder() =>
      new _$PathDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PathDeepLink &&
        path == other.path &&
        fullPage == other.fullPage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, path.hashCode), fullPage.hashCode));
  }
}

class _$PathDeepLinkBuilder extends PathDeepLinkBuilder {
  _$PathDeepLink _$v;

  @override
  String get path {
    _$this;
    return super.path;
  }

  @override
  set path(String path) {
    _$this;
    super.path = path;
  }

  @override
  bool get fullPage {
    _$this;
    return super.fullPage;
  }

  @override
  set fullPage(bool fullPage) {
    _$this;
    super.fullPage = fullPage;
  }

  _$PathDeepLinkBuilder() : super._();

  PathDeepLinkBuilder get _$this {
    if (_$v != null) {
      super.path = _$v.path;
      super.fullPage = _$v.fullPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant PathDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PathDeepLink;
  }

  @override
  void update(void Function(PathDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PathDeepLink build() {
    final _$result =
        _$v ?? new _$PathDeepLink._(path: path, fullPage: fullPage);
    replace(_$result);
    return _$result;
  }
}

class _$ValueDeepLink extends ValueDeepLink {
  @override
  final String data;
  @override
  final String path;
  @override
  final bool fullPage;

  factory _$ValueDeepLink([void Function(ValueDeepLinkBuilder) updates]) =>
      (new ValueDeepLinkBuilder()..update(updates)).build() as _$ValueDeepLink;

  _$ValueDeepLink._({this.data, this.path, this.fullPage}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('ValueDeepLink', 'data');
    }
    if (path == null) {
      throw new BuiltValueNullFieldError('ValueDeepLink', 'path');
    }
    if (fullPage == null) {
      throw new BuiltValueNullFieldError('ValueDeepLink', 'fullPage');
    }
  }

  @override
  ValueDeepLink rebuild(void Function(ValueDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ValueDeepLinkBuilder toBuilder() =>
      new _$ValueDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueDeepLink &&
        data == other.data &&
        path == other.path &&
        fullPage == other.fullPage;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, data.hashCode), path.hashCode), fullPage.hashCode));
  }
}

class _$ValueDeepLinkBuilder extends ValueDeepLinkBuilder {
  _$ValueDeepLink _$v;

  @override
  String get data {
    _$this;
    return super.data;
  }

  @override
  set data(String data) {
    _$this;
    super.data = data;
  }

  @override
  String get path {
    _$this;
    return super.path;
  }

  @override
  set path(String path) {
    _$this;
    super.path = path;
  }

  @override
  bool get fullPage {
    _$this;
    return super.fullPage;
  }

  @override
  set fullPage(bool fullPage) {
    _$this;
    super.fullPage = fullPage;
  }

  _$ValueDeepLinkBuilder() : super._();

  ValueDeepLinkBuilder get _$this {
    if (_$v != null) {
      super.data = _$v.data;
      super.path = _$v.path;
      super.fullPage = _$v.fullPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ValueDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueDeepLink;
  }

  @override
  void update(void Function(ValueDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueDeepLink build() {
    final _$result = _$v ??
        new _$ValueDeepLink._(data: data, path: path, fullPage: fullPage);
    replace(_$result);
    return _$result;
  }
}

class _$SerializedDeepLink extends SerializedDeepLink {
  @override
  final Object data;
  @override
  final String path;
  @override
  final bool fullPage;

  factory _$SerializedDeepLink(
          [void Function(SerializedDeepLinkBuilder) updates]) =>
      (new SerializedDeepLinkBuilder()..update(updates)).build()
          as _$SerializedDeepLink;

  _$SerializedDeepLink._({this.data, this.path, this.fullPage}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('SerializedDeepLink', 'data');
    }
    if (path == null) {
      throw new BuiltValueNullFieldError('SerializedDeepLink', 'path');
    }
    if (fullPage == null) {
      throw new BuiltValueNullFieldError('SerializedDeepLink', 'fullPage');
    }
  }

  @override
  SerializedDeepLink rebuild(
          void Function(SerializedDeepLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$SerializedDeepLinkBuilder toBuilder() =>
      new _$SerializedDeepLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SerializedDeepLink &&
        data == other.data &&
        path == other.path &&
        fullPage == other.fullPage;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, data.hashCode), path.hashCode), fullPage.hashCode));
  }
}

class _$SerializedDeepLinkBuilder extends SerializedDeepLinkBuilder {
  _$SerializedDeepLink _$v;

  @override
  Object get data {
    _$this;
    return super.data;
  }

  @override
  set data(Object data) {
    _$this;
    super.data = data;
  }

  @override
  String get path {
    _$this;
    return super.path;
  }

  @override
  set path(String path) {
    _$this;
    super.path = path;
  }

  @override
  bool get fullPage {
    _$this;
    return super.fullPage;
  }

  @override
  set fullPage(bool fullPage) {
    _$this;
    super.fullPage = fullPage;
  }

  _$SerializedDeepLinkBuilder() : super._();

  SerializedDeepLinkBuilder get _$this {
    if (_$v != null) {
      super.data = _$v.data;
      super.path = _$v.path;
      super.fullPage = _$v.fullPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SerializedDeepLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SerializedDeepLink;
  }

  @override
  void update(void Function(SerializedDeepLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SerializedDeepLink build() {
    final _$result = _$v ??
        new _$SerializedDeepLink._(data: data, path: path, fullPage: fullPage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

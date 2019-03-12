// GENERATED CODE - DO NOT MODIFY BY HAND

part of theme_config_loader;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ThemeConfigLoaderVM extends ThemeConfigLoaderVM {
  @override
  final FirebaseUser authUser;
  @override
  final bool userDataLoaded;
  @override
  final bool settingsLoaded;
  @override
  final bool remoteConfigLoaded;
  @override
  final String theme;

  factory _$ThemeConfigLoaderVM([void updates(ThemeConfigLoaderVMBuilder b)]) =>
      (new ThemeConfigLoaderVMBuilder()..update(updates)).build();

  _$ThemeConfigLoaderVM._(
      {this.authUser,
      this.userDataLoaded,
      this.settingsLoaded,
      this.remoteConfigLoaded,
      this.theme})
      : super._() {
    if (userDataLoaded == null) {
      throw new BuiltValueNullFieldError(
          'ThemeConfigLoaderVM', 'userDataLoaded');
    }
    if (settingsLoaded == null) {
      throw new BuiltValueNullFieldError(
          'ThemeConfigLoaderVM', 'settingsLoaded');
    }
    if (remoteConfigLoaded == null) {
      throw new BuiltValueNullFieldError(
          'ThemeConfigLoaderVM', 'remoteConfigLoaded');
    }
    if (theme == null) {
      throw new BuiltValueNullFieldError('ThemeConfigLoaderVM', 'theme');
    }
  }

  @override
  ThemeConfigLoaderVM rebuild(void updates(ThemeConfigLoaderVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemeConfigLoaderVMBuilder toBuilder() =>
      new ThemeConfigLoaderVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemeConfigLoaderVM &&
        authUser == other.authUser &&
        userDataLoaded == other.userDataLoaded &&
        settingsLoaded == other.settingsLoaded &&
        remoteConfigLoaded == other.remoteConfigLoaded &&
        theme == other.theme;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, authUser.hashCode), userDataLoaded.hashCode),
                settingsLoaded.hashCode),
            remoteConfigLoaded.hashCode),
        theme.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ThemeConfigLoaderVM')
          ..add('authUser', authUser)
          ..add('userDataLoaded', userDataLoaded)
          ..add('settingsLoaded', settingsLoaded)
          ..add('remoteConfigLoaded', remoteConfigLoaded)
          ..add('theme', theme))
        .toString();
  }
}

class ThemeConfigLoaderVMBuilder
    implements Builder<ThemeConfigLoaderVM, ThemeConfigLoaderVMBuilder> {
  _$ThemeConfigLoaderVM _$v;

  FirebaseUser _authUser;
  FirebaseUser get authUser => _$this._authUser;
  set authUser(FirebaseUser authUser) => _$this._authUser = authUser;

  bool _userDataLoaded;
  bool get userDataLoaded => _$this._userDataLoaded;
  set userDataLoaded(bool userDataLoaded) =>
      _$this._userDataLoaded = userDataLoaded;

  bool _settingsLoaded;
  bool get settingsLoaded => _$this._settingsLoaded;
  set settingsLoaded(bool settingsLoaded) =>
      _$this._settingsLoaded = settingsLoaded;

  bool _remoteConfigLoaded;
  bool get remoteConfigLoaded => _$this._remoteConfigLoaded;
  set remoteConfigLoaded(bool remoteConfigLoaded) =>
      _$this._remoteConfigLoaded = remoteConfigLoaded;

  String _theme;
  String get theme => _$this._theme;
  set theme(String theme) => _$this._theme = theme;

  ThemeConfigLoaderVMBuilder();

  ThemeConfigLoaderVMBuilder get _$this {
    if (_$v != null) {
      _authUser = _$v.authUser;
      _userDataLoaded = _$v.userDataLoaded;
      _settingsLoaded = _$v.settingsLoaded;
      _remoteConfigLoaded = _$v.remoteConfigLoaded;
      _theme = _$v.theme;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemeConfigLoaderVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ThemeConfigLoaderVM;
  }

  @override
  void update(void updates(ThemeConfigLoaderVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ThemeConfigLoaderVM build() {
    final _$result = _$v ??
        new _$ThemeConfigLoaderVM._(
            authUser: authUser,
            userDataLoaded: userDataLoaded,
            settingsLoaded: settingsLoaded,
            remoteConfigLoaded: remoteConfigLoaded,
            theme: theme);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDataUninitialized extends UserDataUninitialized {
  factory _$UserDataUninitialized(
          [void Function(UserDataUninitializedBuilder) updates]) =>
      (new UserDataUninitializedBuilder()..update(updates)).build();

  _$UserDataUninitialized._() : super._();

  @override
  UserDataUninitialized rebuild(
          void Function(UserDataUninitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataUninitializedBuilder toBuilder() =>
      new UserDataUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataUninitialized;
  }

  @override
  int get hashCode {
    return 252898823;
  }
}

class UserDataUninitializedBuilder
    implements Builder<UserDataUninitialized, UserDataUninitializedBuilder> {
  _$UserDataUninitialized _$v;

  UserDataUninitializedBuilder();

  @override
  void replace(UserDataUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataUninitialized;
  }

  @override
  void update(void Function(UserDataUninitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataUninitialized build() {
    final _$result = _$v ?? new _$UserDataUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$UserDataFailed extends UserDataFailed {
  @override
  final String error;
  @override
  final String trace;

  factory _$UserDataFailed([void Function(UserDataFailedBuilder) updates]) =>
      (new UserDataFailedBuilder()..update(updates)).build();

  _$UserDataFailed._({this.error, this.trace}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('UserDataFailed', 'error');
    }
  }

  @override
  UserDataFailed rebuild(void Function(UserDataFailedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataFailedBuilder toBuilder() =>
      new UserDataFailedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataFailed &&
        error == other.error &&
        trace == other.trace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), trace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataFailed')
          ..add('error', error)
          ..add('trace', trace))
        .toString();
  }
}

class UserDataFailedBuilder
    implements Builder<UserDataFailed, UserDataFailedBuilder> {
  _$UserDataFailed _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  String _trace;
  String get trace => _$this._trace;
  set trace(String trace) => _$this._trace = trace;

  UserDataFailedBuilder();

  UserDataFailedBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _trace = _$v.trace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDataFailed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataFailed;
  }

  @override
  void update(void Function(UserDataFailedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataFailed build() {
    final _$result = _$v ?? new _$UserDataFailed._(error: error, trace: trace);
    replace(_$result);
    return _$result;
  }
}

class _$UserDataLoading extends UserDataLoading {
  factory _$UserDataLoading([void Function(UserDataLoadingBuilder) updates]) =>
      (new UserDataLoadingBuilder()..update(updates)).build();

  _$UserDataLoading._() : super._();

  @override
  UserDataLoading rebuild(void Function(UserDataLoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataLoadingBuilder toBuilder() =>
      new UserDataLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataLoading;
  }

  @override
  int get hashCode {
    return 780040618;
  }
}

class UserDataLoadingBuilder
    implements Builder<UserDataLoading, UserDataLoadingBuilder> {
  _$UserDataLoading _$v;

  UserDataLoadingBuilder();

  @override
  void replace(UserDataLoading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataLoading;
  }

  @override
  void update(void Function(UserDataLoadingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataLoading build() {
    final _$result = _$v ?? new _$UserDataLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$UserDataUnauthenticated extends UserDataUnauthenticated {
  factory _$UserDataUnauthenticated(
          [void Function(UserDataUnauthenticatedBuilder) updates]) =>
      (new UserDataUnauthenticatedBuilder()..update(updates)).build();

  _$UserDataUnauthenticated._() : super._();

  @override
  UserDataUnauthenticated rebuild(
          void Function(UserDataUnauthenticatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataUnauthenticatedBuilder toBuilder() =>
      new UserDataUnauthenticatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataUnauthenticated;
  }

  @override
  int get hashCode {
    return 938140426;
  }
}

class UserDataUnauthenticatedBuilder
    implements
        Builder<UserDataUnauthenticated, UserDataUnauthenticatedBuilder> {
  _$UserDataUnauthenticated _$v;

  UserDataUnauthenticatedBuilder();

  @override
  void replace(UserDataUnauthenticated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataUnauthenticated;
  }

  @override
  void update(void Function(UserDataUnauthenticatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataUnauthenticated build() {
    final _$result = _$v ?? new _$UserDataUnauthenticated._();
    replace(_$result);
    return _$result;
  }
}

class _$UserDataLoaded extends UserDataLoaded {
  @override
  final FirebaseUser authentication;
  @override
  final UserDocument userDocument;
  @override
  final Settings settings;

  factory _$UserDataLoaded([void Function(UserDataLoadedBuilder) updates]) =>
      (new UserDataLoadedBuilder()..update(updates)).build();

  _$UserDataLoaded._({this.authentication, this.userDocument, this.settings})
      : super._() {
    if (authentication == null) {
      throw new BuiltValueNullFieldError('UserDataLoaded', 'authentication');
    }
    if (userDocument == null) {
      throw new BuiltValueNullFieldError('UserDataLoaded', 'userDocument');
    }
    if (settings == null) {
      throw new BuiltValueNullFieldError('UserDataLoaded', 'settings');
    }
  }

  @override
  UserDataLoaded rebuild(void Function(UserDataLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataLoadedBuilder toBuilder() =>
      new UserDataLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataLoaded &&
        authentication == other.authentication &&
        userDocument == other.userDocument &&
        settings == other.settings;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, authentication.hashCode), userDocument.hashCode),
        settings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataLoaded')
          ..add('authentication', authentication)
          ..add('userDocument', userDocument)
          ..add('settings', settings))
        .toString();
  }
}

class UserDataLoadedBuilder
    implements Builder<UserDataLoaded, UserDataLoadedBuilder> {
  _$UserDataLoaded _$v;

  FirebaseUser _authentication;
  FirebaseUser get authentication => _$this._authentication;
  set authentication(FirebaseUser authentication) =>
      _$this._authentication = authentication;

  UserDocumentBuilder _userDocument;
  UserDocumentBuilder get userDocument =>
      _$this._userDocument ??= new UserDocumentBuilder();
  set userDocument(UserDocumentBuilder userDocument) =>
      _$this._userDocument = userDocument;

  SettingsBuilder _settings;
  SettingsBuilder get settings => _$this._settings ??= new SettingsBuilder();
  set settings(SettingsBuilder settings) => _$this._settings = settings;

  UserDataLoadedBuilder();

  UserDataLoadedBuilder get _$this {
    if (_$v != null) {
      _authentication = _$v.authentication;
      _userDocument = _$v.userDocument?.toBuilder();
      _settings = _$v.settings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDataLoaded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataLoaded;
  }

  @override
  void update(void Function(UserDataLoadedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataLoaded build() {
    _$UserDataLoaded _$result;
    try {
      _$result = _$v ??
          new _$UserDataLoaded._(
              authentication: authentication,
              userDocument: userDocument.build(),
              settings: settings.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userDocument';
        userDocument.build();
        _$failedField = 'settings';
        settings.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserDataLoaded', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
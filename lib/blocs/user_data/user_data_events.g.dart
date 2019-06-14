// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteUserDataArrived extends RemoteUserDataArrived {
  @override
  final FirebaseUser authentication;
  @override
  final UserDocument userDocument;
  @override
  final Settings settings;

  factory _$RemoteUserDataArrived(
          [void Function(RemoteUserDataArrivedBuilder) updates]) =>
      (new RemoteUserDataArrivedBuilder()..update(updates)).build();

  _$RemoteUserDataArrived._(
      {this.authentication, this.userDocument, this.settings})
      : super._() {
    if (authentication == null) {
      throw new BuiltValueNullFieldError(
          'RemoteUserDataArrived', 'authentication');
    }
    if (userDocument == null) {
      throw new BuiltValueNullFieldError(
          'RemoteUserDataArrived', 'userDocument');
    }
    if (settings == null) {
      throw new BuiltValueNullFieldError('RemoteUserDataArrived', 'settings');
    }
  }

  @override
  RemoteUserDataArrived rebuild(
          void Function(RemoteUserDataArrivedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteUserDataArrivedBuilder toBuilder() =>
      new RemoteUserDataArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteUserDataArrived &&
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
    return (newBuiltValueToStringHelper('RemoteUserDataArrived')
          ..add('authentication', authentication)
          ..add('userDocument', userDocument)
          ..add('settings', settings))
        .toString();
  }
}

class RemoteUserDataArrivedBuilder
    implements Builder<RemoteUserDataArrived, RemoteUserDataArrivedBuilder> {
  _$RemoteUserDataArrived _$v;

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

  RemoteUserDataArrivedBuilder();

  RemoteUserDataArrivedBuilder get _$this {
    if (_$v != null) {
      _authentication = _$v.authentication;
      _userDocument = _$v.userDocument?.toBuilder();
      _settings = _$v.settings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteUserDataArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteUserDataArrived;
  }

  @override
  void update(void Function(RemoteUserDataArrivedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteUserDataArrived build() {
    _$RemoteUserDataArrived _$result;
    try {
      _$result = _$v ??
          new _$RemoteUserDataArrived._(
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
            'RemoteUserDataArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$StartLoadingUserData extends StartLoadingUserData {
  factory _$StartLoadingUserData(
          [void Function(StartLoadingUserDataBuilder) updates]) =>
      (new StartLoadingUserDataBuilder()..update(updates)).build();

  _$StartLoadingUserData._() : super._();

  @override
  StartLoadingUserData rebuild(
          void Function(StartLoadingUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StartLoadingUserDataBuilder toBuilder() =>
      new StartLoadingUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StartLoadingUserData;
  }

  @override
  int get hashCode {
    return 184832232;
  }
}

class StartLoadingUserDataBuilder
    implements Builder<StartLoadingUserData, StartLoadingUserDataBuilder> {
  _$StartLoadingUserData _$v;

  StartLoadingUserDataBuilder();

  @override
  void replace(StartLoadingUserData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StartLoadingUserData;
  }

  @override
  void update(void Function(StartLoadingUserDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StartLoadingUserData build() {
    final _$result = _$v ?? new _$StartLoadingUserData._();
    replace(_$result);
    return _$result;
  }
}

class _$UserDataError extends UserDataError {
  @override
  final String error;
  @override
  final String trace;

  factory _$UserDataError([void Function(UserDataErrorBuilder) updates]) =>
      (new UserDataErrorBuilder()..update(updates)).build();

  _$UserDataError._({this.error, this.trace}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('UserDataError', 'error');
    }
  }

  @override
  UserDataError rebuild(void Function(UserDataErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataErrorBuilder toBuilder() => new UserDataErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataError &&
        error == other.error &&
        trace == other.trace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), trace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataError')
          ..add('error', error)
          ..add('trace', trace))
        .toString();
  }
}

class UserDataErrorBuilder
    implements Builder<UserDataError, UserDataErrorBuilder> {
  _$UserDataError _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  String _trace;
  String get trace => _$this._trace;
  set trace(String trace) => _$this._trace = trace;

  UserDataErrorBuilder();

  UserDataErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _trace = _$v.trace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDataError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataError;
  }

  @override
  void update(void Function(UserDataErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataError build() {
    final _$result = _$v ?? new _$UserDataError._(error: error, trace: trace);
    replace(_$result);
    return _$result;
  }
}

class _$OnboardUser extends OnboardUser {
  factory _$OnboardUser([void Function(OnboardUserBuilder) updates]) =>
      (new OnboardUserBuilder()..update(updates)).build();

  _$OnboardUser._() : super._();

  @override
  OnboardUser rebuild(void Function(OnboardUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OnboardUserBuilder toBuilder() => new OnboardUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OnboardUser;
  }

  @override
  int get hashCode {
    return 509793739;
  }
}

class OnboardUserBuilder implements Builder<OnboardUser, OnboardUserBuilder> {
  _$OnboardUser _$v;

  OnboardUserBuilder();

  @override
  void replace(OnboardUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OnboardUser;
  }

  @override
  void update(void Function(OnboardUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OnboardUser build() {
    final _$result = _$v ?? new _$OnboardUser._();
    replace(_$result);
    return _$result;
  }
}

class _$UpdateSettings extends UpdateSettings {
  @override
  final bool darkMode;

  factory _$UpdateSettings([void Function(UpdateSettingsBuilder) updates]) =>
      (new UpdateSettingsBuilder()..update(updates)).build();

  _$UpdateSettings._({this.darkMode}) : super._() {
    if (darkMode == null) {
      throw new BuiltValueNullFieldError('UpdateSettings', 'darkMode');
    }
  }

  @override
  UpdateSettings rebuild(void Function(UpdateSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateSettingsBuilder toBuilder() =>
      new UpdateSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateSettings && darkMode == other.darkMode;
  }

  @override
  int get hashCode {
    return $jf($jc(0, darkMode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateSettings')
          ..add('darkMode', darkMode))
        .toString();
  }
}

class UpdateSettingsBuilder
    implements Builder<UpdateSettings, UpdateSettingsBuilder> {
  _$UpdateSettings _$v;

  bool _darkMode;
  bool get darkMode => _$this._darkMode;
  set darkMode(bool darkMode) => _$this._darkMode = darkMode;

  UpdateSettingsBuilder();

  UpdateSettingsBuilder get _$this {
    if (_$v != null) {
      _darkMode = _$v.darkMode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateSettings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateSettings;
  }

  @override
  void update(void Function(UpdateSettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateSettings build() {
    final _$result = _$v ?? new _$UpdateSettings._(darkMode: darkMode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

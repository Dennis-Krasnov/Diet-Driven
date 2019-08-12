// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitUserData extends InitUserData {
  factory _$InitUserData([void Function(InitUserDataBuilder) updates]) =>
      (new InitUserDataBuilder()..update(updates)).build();

  _$InitUserData._() : super._();

  @override
  InitUserData rebuild(void Function(InitUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitUserDataBuilder toBuilder() => new InitUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitUserData;
  }

  @override
  int get hashCode {
    return 437658457;
  }
}

class InitUserDataBuilder
    implements Builder<InitUserData, InitUserDataBuilder> {
  _$InitUserData _$v;

  InitUserDataBuilder();

  @override
  void replace(InitUserData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitUserData;
  }

  @override
  void update(void Function(InitUserDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitUserData build() {
    final _$result = _$v ?? new _$InitUserData._();
    replace(_$result);
    return _$result;
  }
}

class _$RemoteUserDataArrived extends RemoteUserDataArrived {
  @override
  final Authentication authentication;
  @override
  final UserDocument userDocument;
  @override
  final Settings settings;
  @override
  final Settings userSettings;
  @override
  final SubscriptionType subscription;

  factory _$RemoteUserDataArrived(
          [void Function(RemoteUserDataArrivedBuilder) updates]) =>
      (new RemoteUserDataArrivedBuilder()..update(updates)).build();

  _$RemoteUserDataArrived._(
      {this.authentication,
      this.userDocument,
      this.settings,
      this.userSettings,
      this.subscription})
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
    if (userSettings == null) {
      throw new BuiltValueNullFieldError(
          'RemoteUserDataArrived', 'userSettings');
    }
    if (subscription == null) {
      throw new BuiltValueNullFieldError(
          'RemoteUserDataArrived', 'subscription');
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
        settings == other.settings &&
        userSettings == other.userSettings &&
        subscription == other.subscription;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, authentication.hashCode), userDocument.hashCode),
                settings.hashCode),
            userSettings.hashCode),
        subscription.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteUserDataArrived')
          ..add('authentication', authentication)
          ..add('userDocument', userDocument)
          ..add('settings', settings)
          ..add('userSettings', userSettings)
          ..add('subscription', subscription))
        .toString();
  }
}

class RemoteUserDataArrivedBuilder
    implements Builder<RemoteUserDataArrived, RemoteUserDataArrivedBuilder> {
  _$RemoteUserDataArrived _$v;

  AuthenticationBuilder _authentication;
  AuthenticationBuilder get authentication =>
      _$this._authentication ??= new AuthenticationBuilder();
  set authentication(AuthenticationBuilder authentication) =>
      _$this._authentication = authentication;

  UserDocumentBuilder _userDocument;
  UserDocumentBuilder get userDocument =>
      _$this._userDocument ??= new UserDocumentBuilder();
  set userDocument(UserDocumentBuilder userDocument) =>
      _$this._userDocument = userDocument;

  SettingsBuilder _settings;
  SettingsBuilder get settings => _$this._settings ??= new SettingsBuilder();
  set settings(SettingsBuilder settings) => _$this._settings = settings;

  SettingsBuilder _userSettings;
  SettingsBuilder get userSettings =>
      _$this._userSettings ??= new SettingsBuilder();
  set userSettings(SettingsBuilder userSettings) =>
      _$this._userSettings = userSettings;

  SubscriptionType _subscription;
  SubscriptionType get subscription => _$this._subscription;
  set subscription(SubscriptionType subscription) =>
      _$this._subscription = subscription;

  RemoteUserDataArrivedBuilder();

  RemoteUserDataArrivedBuilder get _$this {
    if (_$v != null) {
      _authentication = _$v.authentication?.toBuilder();
      _userDocument = _$v.userDocument?.toBuilder();
      _settings = _$v.settings?.toBuilder();
      _userSettings = _$v.userSettings?.toBuilder();
      _subscription = _$v.subscription;
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
              authentication: authentication.build(),
              userDocument: userDocument.build(),
              settings: settings.build(),
              userSettings: userSettings.build(),
              subscription: subscription);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'authentication';
        authentication.build();
        _$failedField = 'userDocument';
        userDocument.build();
        _$failedField = 'settings';
        settings.build();
        _$failedField = 'userSettings';
        userSettings.build();
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

class _$UserDataError extends UserDataError {
  @override
  final Object error;
  @override
  final StackTrace stacktrace;

  factory _$UserDataError([void Function(UserDataErrorBuilder) updates]) =>
      (new UserDataErrorBuilder()..update(updates)).build();

  _$UserDataError._({this.error, this.stacktrace}) : super._() {
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
        stacktrace == other.stacktrace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), stacktrace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataError')
          ..add('error', error)
          ..add('stacktrace', stacktrace))
        .toString();
  }
}

class UserDataErrorBuilder
    implements Builder<UserDataError, UserDataErrorBuilder>, BuiltErrorBuilder {
  _$UserDataError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  StackTrace _stacktrace;
  StackTrace get stacktrace => _$this._stacktrace;
  set stacktrace(StackTrace stacktrace) => _$this._stacktrace = stacktrace;

  UserDataErrorBuilder();

  UserDataErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _stacktrace = _$v.stacktrace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserDataError other) {
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
    final _$result =
        _$v ?? new _$UserDataError._(error: error, stacktrace: stacktrace);
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

class _$UpdateDarkMode extends UpdateDarkMode {
  @override
  final bool darkMode;
  @override
  final Completer<void> completer;

  factory _$UpdateDarkMode([void Function(UpdateDarkModeBuilder) updates]) =>
      (new UpdateDarkModeBuilder()..update(updates)).build();

  _$UpdateDarkMode._({this.darkMode, this.completer}) : super._() {
    if (darkMode == null) {
      throw new BuiltValueNullFieldError('UpdateDarkMode', 'darkMode');
    }
  }

  @override
  UpdateDarkMode rebuild(void Function(UpdateDarkModeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateDarkModeBuilder toBuilder() =>
      new UpdateDarkModeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateDarkMode &&
        darkMode == other.darkMode &&
        completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, darkMode.hashCode), completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateDarkMode')
          ..add('darkMode', darkMode)
          ..add('completer', completer))
        .toString();
  }
}

class UpdateDarkModeBuilder
    implements Builder<UpdateDarkMode, UpdateDarkModeBuilder> {
  _$UpdateDarkMode _$v;

  bool _darkMode;
  bool get darkMode => _$this._darkMode;
  set darkMode(bool darkMode) => _$this._darkMode = darkMode;

  Completer<void> _completer;
  Completer<void> get completer => _$this._completer;
  set completer(Completer<void> completer) => _$this._completer = completer;

  UpdateDarkModeBuilder();

  UpdateDarkModeBuilder get _$this {
    if (_$v != null) {
      _darkMode = _$v.darkMode;
      _completer = _$v.completer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateDarkMode other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateDarkMode;
  }

  @override
  void update(void Function(UpdateDarkModeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateDarkMode build() {
    final _$result =
        _$v ?? new _$UpdateDarkMode._(darkMode: darkMode, completer: completer);
    replace(_$result);
    return _$result;
  }
}

class _$UpdatePrimaryColour extends UpdatePrimaryColour {
  @override
  final int colourValue;
  @override
  final Completer<void> completer;

  factory _$UpdatePrimaryColour(
          [void Function(UpdatePrimaryColourBuilder) updates]) =>
      (new UpdatePrimaryColourBuilder()..update(updates)).build();

  _$UpdatePrimaryColour._({this.colourValue, this.completer}) : super._() {
    if (colourValue == null) {
      throw new BuiltValueNullFieldError('UpdatePrimaryColour', 'colourValue');
    }
  }

  @override
  UpdatePrimaryColour rebuild(
          void Function(UpdatePrimaryColourBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdatePrimaryColourBuilder toBuilder() =>
      new UpdatePrimaryColourBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdatePrimaryColour &&
        colourValue == other.colourValue &&
        completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, colourValue.hashCode), completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdatePrimaryColour')
          ..add('colourValue', colourValue)
          ..add('completer', completer))
        .toString();
  }
}

class UpdatePrimaryColourBuilder
    implements Builder<UpdatePrimaryColour, UpdatePrimaryColourBuilder> {
  _$UpdatePrimaryColour _$v;

  int _colourValue;
  int get colourValue => _$this._colourValue;
  set colourValue(int colourValue) => _$this._colourValue = colourValue;

  Completer<void> _completer;
  Completer<void> get completer => _$this._completer;
  set completer(Completer<void> completer) => _$this._completer = completer;

  UpdatePrimaryColourBuilder();

  UpdatePrimaryColourBuilder get _$this {
    if (_$v != null) {
      _colourValue = _$v.colourValue;
      _completer = _$v.completer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdatePrimaryColour other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdatePrimaryColour;
  }

  @override
  void update(void Function(UpdatePrimaryColourBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdatePrimaryColour build() {
    final _$result = _$v ??
        new _$UpdatePrimaryColour._(
            colourValue: colourValue, completer: completer);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

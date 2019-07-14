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
  final Object error;
  @override
  final StackTrace stacktrace;

  factory _$UserDataFailed([void Function(UserDataFailedBuilder) updates]) =>
      (new UserDataFailedBuilder()..update(updates)).build();

  _$UserDataFailed._({this.error, this.stacktrace}) : super._() {
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
        stacktrace == other.stacktrace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), stacktrace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataFailed')
          ..add('error', error)
          ..add('stacktrace', stacktrace))
        .toString();
  }
}

class UserDataFailedBuilder
    implements
        Builder<UserDataFailed, UserDataFailedBuilder>,
        BuiltErrorBuilder {
  _$UserDataFailed _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  StackTrace _stacktrace;
  StackTrace get stacktrace => _$this._stacktrace;
  set stacktrace(StackTrace stacktrace) => _$this._stacktrace = stacktrace;

  UserDataFailedBuilder();

  UserDataFailedBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _stacktrace = _$v.stacktrace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserDataFailed other) {
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
    final _$result =
        _$v ?? new _$UserDataFailed._(error: error, stacktrace: stacktrace);
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
  @override
  final SubscriptionType subscription;

  factory _$UserDataLoaded([void Function(UserDataLoadedBuilder) updates]) =>
      (new UserDataLoadedBuilder()..update(updates)).build();

  _$UserDataLoaded._(
      {this.authentication,
      this.userDocument,
      this.settings,
      this.subscription})
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
    if (subscription == null) {
      throw new BuiltValueNullFieldError('UserDataLoaded', 'subscription');
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
        settings == other.settings &&
        subscription == other.subscription;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, authentication.hashCode), userDocument.hashCode),
            settings.hashCode),
        subscription.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataLoaded')
          ..add('authentication', authentication)
          ..add('userDocument', userDocument)
          ..add('settings', settings)
          ..add('subscription', subscription))
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

  SubscriptionType _subscription;
  SubscriptionType get subscription => _$this._subscription;
  set subscription(SubscriptionType subscription) =>
      _$this._subscription = subscription;

  UserDataLoadedBuilder();

  UserDataLoadedBuilder get _$this {
    if (_$v != null) {
      _authentication = _$v.authentication;
      _userDocument = _$v.userDocument?.toBuilder();
      _settings = _$v.settings?.toBuilder();
      _subscription = _$v.subscription;
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
              settings: settings.build(),
              subscription: subscription);
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

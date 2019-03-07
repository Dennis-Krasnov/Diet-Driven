// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserState extends UserState {
  @override
  final FirebaseUser authUser;
  @override
  final bool staleRemoteConfig;
  @override
  final SubscriptionType currentSubscription;

  factory _$UserState([void updates(UserStateBuilder b)]) =>
      (new UserStateBuilder()..update(updates)).build() as _$UserState;

  _$UserState._(
      {this.authUser, this.staleRemoteConfig, this.currentSubscription})
      : super._() {
    if (staleRemoteConfig == null) {
      throw new BuiltValueNullFieldError('UserState', 'staleRemoteConfig');
    }
    if (currentSubscription == null) {
      throw new BuiltValueNullFieldError('UserState', 'currentSubscription');
    }
  }

  @override
  UserState rebuild(void updates(UserStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$UserStateBuilder toBuilder() => new _$UserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserState &&
        authUser == other.authUser &&
        staleRemoteConfig == other.staleRemoteConfig &&
        currentSubscription == other.currentSubscription;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, authUser.hashCode), staleRemoteConfig.hashCode),
        currentSubscription.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserState')
          ..add('authUser', authUser)
          ..add('staleRemoteConfig', staleRemoteConfig)
          ..add('currentSubscription', currentSubscription))
        .toString();
  }
}

class _$UserStateBuilder extends UserStateBuilder {
  _$UserState _$v;

  @override
  FirebaseUser get authUser {
    _$this;
    return super.authUser;
  }

  @override
  set authUser(FirebaseUser authUser) {
    _$this;
    super.authUser = authUser;
  }

  @override
  bool get staleRemoteConfig {
    _$this;
    return super.staleRemoteConfig;
  }

  @override
  set staleRemoteConfig(bool staleRemoteConfig) {
    _$this;
    super.staleRemoteConfig = staleRemoteConfig;
  }

  @override
  SubscriptionType get currentSubscription {
    _$this;
    return super.currentSubscription;
  }

  @override
  set currentSubscription(SubscriptionType currentSubscription) {
    _$this;
    super.currentSubscription = currentSubscription;
  }

  _$UserStateBuilder() : super._();

  UserStateBuilder get _$this {
    if (_$v != null) {
      super.authUser = _$v.authUser;
      super.staleRemoteConfig = _$v.staleRemoteConfig;
      super.currentSubscription = _$v.currentSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserState;
  }

  @override
  void update(void updates(UserStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserState build() {
    final _$result = _$v ??
        new _$UserState._(
            authUser: authUser,
            staleRemoteConfig: staleRemoteConfig,
            currentSubscription: currentSubscription);
    replace(_$result);
    return _$result;
  }
}

class _$UserStateDocument extends UserStateDocument {
  @override
  final String userId;
  @override
  final String subPath;
  @override
  final StreamSubscription streamSubscription;

  factory _$UserStateDocument([void updates(UserStateDocumentBuilder b)]) =>
      (new UserStateDocumentBuilder()..update(updates)).build();

  _$UserStateDocument._({this.userId, this.subPath, this.streamSubscription})
      : super._();

  @override
  UserStateDocument rebuild(void updates(UserStateDocumentBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStateDocumentBuilder toBuilder() =>
      new UserStateDocumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStateDocument &&
        userId == other.userId &&
        subPath == other.subPath;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), subPath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserStateDocument')
          ..add('userId', userId)
          ..add('subPath', subPath)
          ..add('streamSubscription', streamSubscription))
        .toString();
  }
}

class UserStateDocumentBuilder
    implements Builder<UserStateDocument, UserStateDocumentBuilder> {
  _$UserStateDocument _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _subPath;
  String get subPath => _$this._subPath;
  set subPath(String subPath) => _$this._subPath = subPath;

  StreamSubscription _streamSubscription;
  StreamSubscription get streamSubscription => _$this._streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription) =>
      _$this._streamSubscription = streamSubscription;

  UserStateDocumentBuilder();

  UserStateDocumentBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _subPath = _$v.subPath;
      _streamSubscription = _$v.streamSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStateDocument other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserStateDocument;
  }

  @override
  void update(void updates(UserStateDocumentBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserStateDocument build() {
    final _$result = _$v ??
        new _$UserStateDocument._(
            userId: userId,
            subPath: subPath,
            streamSubscription: streamSubscription);
    replace(_$result);
    return _$result;
  }
}

class _$SettingsCollection extends SettingsCollection {
  @override
  final String userId;
  @override
  final StreamSubscription streamSubscription;

  factory _$SettingsCollection([void updates(SettingsCollectionBuilder b)]) =>
      (new SettingsCollectionBuilder()..update(updates)).build();

  _$SettingsCollection._({this.userId, this.streamSubscription}) : super._();

  @override
  SettingsCollection rebuild(void updates(SettingsCollectionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsCollectionBuilder toBuilder() =>
      new SettingsCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsCollection && userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsCollection')
          ..add('userId', userId)
          ..add('streamSubscription', streamSubscription))
        .toString();
  }
}

class SettingsCollectionBuilder
    implements Builder<SettingsCollection, SettingsCollectionBuilder> {
  _$SettingsCollection _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  StreamSubscription _streamSubscription;
  StreamSubscription get streamSubscription => _$this._streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription) =>
      _$this._streamSubscription = streamSubscription;

  SettingsCollectionBuilder();

  SettingsCollectionBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _streamSubscription = _$v.streamSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsCollection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsCollection;
  }

  @override
  void update(void updates(SettingsCollectionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsCollection build() {
    final _$result = _$v ??
        new _$SettingsCollection._(
            userId: userId, streamSubscription: streamSubscription);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserData> _$userDataSerializer = new _$UserDataSerializer();

class _$UserDataSerializer implements StructuredSerializer<UserData> {
  @override
  final Iterable<Type> types = const [UserData, _$UserData];
  @override
  final String wireName = 'UserData';

  @override
  Iterable serialize(Serializers serializers, UserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'currentSubscription',
      serializers.serialize(object.currentSubscription,
          specifiedType: const FullType(String)),
      'settings',
      serializers.serialize(object.settings,
          specifiedType: const FullType(Settings)),
    ];
    if (object.userId != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(object.userId,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  UserData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'currentSubscription':
          result.currentSubscription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'settings':
          result.settings = serializers.deserialize(value,
              specifiedType: const FullType(Settings)) as Settings;
          break;
      }
    }

    return result.build();
  }
}

class _$UserData extends UserData {
  @override
  final String userId;
  @override
  final String email;
  @override
  final String name;
  @override
  final String currentSubscription;
  @override
  final Settings settings;

  factory _$UserData([void updates(UserDataBuilder b)]) =>
      (new UserDataBuilder()..update(updates)).build() as _$UserData;

  _$UserData._(
      {this.userId,
      this.email,
      this.name,
      this.currentSubscription,
      this.settings})
      : super._() {
    if (currentSubscription == null) {
      throw new BuiltValueNullFieldError('UserData', 'currentSubscription');
    }
    if (settings == null) {
      throw new BuiltValueNullFieldError('UserData', 'settings');
    }
  }

  @override
  UserData rebuild(void updates(UserDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$UserDataBuilder toBuilder() => new _$UserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserData &&
        userId == other.userId &&
        email == other.email &&
        name == other.name &&
        currentSubscription == other.currentSubscription &&
        settings == other.settings;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, userId.hashCode), email.hashCode), name.hashCode),
            currentSubscription.hashCode),
        settings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserData')
          ..add('userId', userId)
          ..add('email', email)
          ..add('name', name)
          ..add('currentSubscription', currentSubscription)
          ..add('settings', settings))
        .toString();
  }
}

class _$UserDataBuilder extends UserDataBuilder {
  _$UserData _$v;

  @override
  String get userId {
    _$this;
    return super.userId;
  }

  @override
  set userId(String userId) {
    _$this;
    super.userId = userId;
  }

  @override
  String get email {
    _$this;
    return super.email;
  }

  @override
  set email(String email) {
    _$this;
    super.email = email;
  }

  @override
  String get name {
    _$this;
    return super.name;
  }

  @override
  set name(String name) {
    _$this;
    super.name = name;
  }

  @override
  String get currentSubscription {
    _$this;
    return super.currentSubscription;
  }

  @override
  set currentSubscription(String currentSubscription) {
    _$this;
    super.currentSubscription = currentSubscription;
  }

  @override
  Settings get settings {
    _$this;
    return super.settings;
  }

  @override
  set settings(Settings settings) {
    _$this;
    super.settings = settings;
  }

  _$UserDataBuilder() : super._();

  UserDataBuilder get _$this {
    if (_$v != null) {
      super.userId = _$v.userId;
      super.email = _$v.email;
      super.name = _$v.name;
      super.currentSubscription = _$v.currentSubscription;
      super.settings = _$v.settings;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserData;
  }

  @override
  void update(void updates(UserDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserData build() {
    final _$result = _$v ??
        new _$UserData._(
            userId: userId,
            email: email,
            name: name,
            currentSubscription: currentSubscription,
            settings: settings);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_document.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDocument> _$userDocumentSerializer =
    new _$UserDocumentSerializer();

class _$UserDocumentSerializer implements StructuredSerializer<UserDocument> {
  @override
  final Iterable<Type> types = const [UserDocument, _$UserDocument];
  @override
  final String wireName = 'UserDocument';

  @override
  Iterable serialize(Serializers serializers, UserDocument object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'currentSubscription',
      serializers.serialize(object.currentSubscription,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserDocument deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDocumentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currentSubscription':
          result.currentSubscription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserDocument extends UserDocument {
  @override
  final String currentSubscription;

  factory _$UserDocument([void updates(UserDocumentBuilder b)]) =>
      (new UserDocumentBuilder()..update(updates)).build();

  _$UserDocument._({this.currentSubscription}) : super._() {
    if (currentSubscription == null) {
      throw new BuiltValueNullFieldError('UserDocument', 'currentSubscription');
    }
  }

  @override
  UserDocument rebuild(void updates(UserDocumentBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDocumentBuilder toBuilder() => new UserDocumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDocument &&
        currentSubscription == other.currentSubscription;
  }

  @override
  int get hashCode {
    return $jf($jc(0, currentSubscription.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDocument')
          ..add('currentSubscription', currentSubscription))
        .toString();
  }
}

class UserDocumentBuilder
    implements Builder<UserDocument, UserDocumentBuilder> {
  _$UserDocument _$v;

  String _currentSubscription;
  String get currentSubscription => _$this._currentSubscription;
  set currentSubscription(String currentSubscription) =>
      _$this._currentSubscription = currentSubscription;

  UserDocumentBuilder();

  UserDocumentBuilder get _$this {
    if (_$v != null) {
      _currentSubscription = _$v.currentSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDocument other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDocument;
  }

  @override
  void update(void updates(UserDocumentBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDocument build() {
    final _$result =
        _$v ?? new _$UserDocument._(currentSubscription: currentSubscription);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

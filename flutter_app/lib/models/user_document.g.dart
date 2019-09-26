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
  Iterable<Object> serialize(Serializers serializers, UserDocument object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  UserDocument deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new UserDocumentBuilder().build();
  }
}

class _$UserDocument extends UserDocument {
  factory _$UserDocument([void Function(UserDocumentBuilder) updates]) =>
      (new UserDocumentBuilder()..update(updates)).build();

  _$UserDocument._() : super._();

  @override
  UserDocument rebuild(void Function(UserDocumentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDocumentBuilder toBuilder() => new UserDocumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDocument;
  }

  @override
  int get hashCode {
    return 189037343;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('UserDocument').toString();
  }
}

class UserDocumentBuilder
    implements Builder<UserDocument, UserDocumentBuilder> {
  _$UserDocument _$v;

  UserDocumentBuilder();

  @override
  void replace(UserDocument other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDocument;
  }

  @override
  void update(void Function(UserDocumentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDocument build() {
    final _$result = _$v ?? new _$UserDocument._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

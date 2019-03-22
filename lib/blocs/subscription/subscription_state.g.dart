// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscriptionUninitialized extends SubscriptionUninitialized {
  factory _$SubscriptionUninitialized(
          [void updates(SubscriptionUninitializedBuilder b)]) =>
      (new SubscriptionUninitializedBuilder()..update(updates)).build();

  _$SubscriptionUninitialized._() : super._();

  @override
  SubscriptionUninitialized rebuild(
          void updates(SubscriptionUninitializedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionUninitializedBuilder toBuilder() =>
      new SubscriptionUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionUninitialized;
  }

  @override
  int get hashCode {
    return 201393689;
  }
}

class SubscriptionUninitializedBuilder
    implements
        Builder<SubscriptionUninitialized, SubscriptionUninitializedBuilder> {
  _$SubscriptionUninitialized _$v;

  SubscriptionUninitializedBuilder();

  @override
  void replace(SubscriptionUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubscriptionUninitialized;
  }

  @override
  void update(void updates(SubscriptionUninitializedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SubscriptionUninitialized build() {
    final _$result = _$v ?? new _$SubscriptionUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$NoSubscription extends NoSubscription {
  factory _$NoSubscription([void updates(NoSubscriptionBuilder b)]) =>
      (new NoSubscriptionBuilder()..update(updates)).build();

  _$NoSubscription._() : super._();

  @override
  NoSubscription rebuild(void updates(NoSubscriptionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NoSubscriptionBuilder toBuilder() =>
      new NoSubscriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NoSubscription;
  }

  @override
  int get hashCode {
    return 632906267;
  }
}

class NoSubscriptionBuilder
    implements Builder<NoSubscription, NoSubscriptionBuilder> {
  _$NoSubscription _$v;

  NoSubscriptionBuilder();

  @override
  void replace(NoSubscription other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NoSubscription;
  }

  @override
  void update(void updates(NoSubscriptionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NoSubscription build() {
    final _$result = _$v ?? new _$NoSubscription._();
    replace(_$result);
    return _$result;
  }
}

class _$HasSubscription extends HasSubscription {
  @override
  final SubscriptionType subscriptionType;

  factory _$HasSubscription([void updates(HasSubscriptionBuilder b)]) =>
      (new HasSubscriptionBuilder()..update(updates)).build();

  _$HasSubscription._({this.subscriptionType}) : super._() {
    if (subscriptionType == null) {
      throw new BuiltValueNullFieldError('HasSubscription', 'subscriptionType');
    }
  }

  @override
  HasSubscription rebuild(void updates(HasSubscriptionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  HasSubscriptionBuilder toBuilder() =>
      new HasSubscriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HasSubscription &&
        subscriptionType == other.subscriptionType;
  }

  @override
  int get hashCode {
    return $jf($jc(0, subscriptionType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HasSubscription')
          ..add('subscriptionType', subscriptionType))
        .toString();
  }
}

class HasSubscriptionBuilder
    implements Builder<HasSubscription, HasSubscriptionBuilder> {
  _$HasSubscription _$v;

  SubscriptionType _subscriptionType;
  SubscriptionType get subscriptionType => _$this._subscriptionType;
  set subscriptionType(SubscriptionType subscriptionType) =>
      _$this._subscriptionType = subscriptionType;

  HasSubscriptionBuilder();

  HasSubscriptionBuilder get _$this {
    if (_$v != null) {
      _subscriptionType = _$v.subscriptionType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HasSubscription other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HasSubscription;
  }

  @override
  void update(void updates(HasSubscriptionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$HasSubscription build() {
    final _$result =
        _$v ?? new _$HasSubscription._(subscriptionType: subscriptionType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

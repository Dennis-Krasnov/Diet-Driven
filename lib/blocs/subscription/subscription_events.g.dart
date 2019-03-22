// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoadExistingSubscription extends LoadExistingSubscription {
  factory _$LoadExistingSubscription(
          [void updates(LoadExistingSubscriptionBuilder b)]) =>
      (new LoadExistingSubscriptionBuilder()..update(updates)).build();

  _$LoadExistingSubscription._() : super._();

  @override
  LoadExistingSubscription rebuild(
          void updates(LoadExistingSubscriptionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoadExistingSubscriptionBuilder toBuilder() =>
      new LoadExistingSubscriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoadExistingSubscription;
  }

  @override
  int get hashCode {
    return 162373163;
  }
}

class LoadExistingSubscriptionBuilder
    implements
        Builder<LoadExistingSubscription, LoadExistingSubscriptionBuilder> {
  _$LoadExistingSubscription _$v;

  LoadExistingSubscriptionBuilder();

  @override
  void replace(LoadExistingSubscription other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoadExistingSubscription;
  }

  @override
  void update(void updates(LoadExistingSubscriptionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoadExistingSubscription build() {
    final _$result = _$v ?? new _$LoadExistingSubscription._();
    replace(_$result);
    return _$result;
  }
}

class _$Subscribed extends Subscribed {
  @override
  final SubscriptionType subscriptionType;

  factory _$Subscribed([void updates(SubscribedBuilder b)]) =>
      (new SubscribedBuilder()..update(updates)).build();

  _$Subscribed._({this.subscriptionType}) : super._() {
    if (subscriptionType == null) {
      throw new BuiltValueNullFieldError('Subscribed', 'subscriptionType');
    }
  }

  @override
  Subscribed rebuild(void updates(SubscribedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscribedBuilder toBuilder() => new SubscribedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Subscribed && subscriptionType == other.subscriptionType;
  }

  @override
  int get hashCode {
    return $jf($jc(0, subscriptionType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Subscribed')
          ..add('subscriptionType', subscriptionType))
        .toString();
  }
}

class SubscribedBuilder implements Builder<Subscribed, SubscribedBuilder> {
  _$Subscribed _$v;

  SubscriptionType _subscriptionType;
  SubscriptionType get subscriptionType => _$this._subscriptionType;
  set subscriptionType(SubscriptionType subscriptionType) =>
      _$this._subscriptionType = subscriptionType;

  SubscribedBuilder();

  SubscribedBuilder get _$this {
    if (_$v != null) {
      _subscriptionType = _$v.subscriptionType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Subscribed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Subscribed;
  }

  @override
  void update(void updates(SubscribedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Subscribed build() {
    final _$result =
        _$v ?? new _$Subscribed._(subscriptionType: subscriptionType);
    replace(_$result);
    return _$result;
  }
}

class _$Unsubscribed extends Unsubscribed {
  factory _$Unsubscribed([void updates(UnsubscribedBuilder b)]) =>
      (new UnsubscribedBuilder()..update(updates)).build();

  _$Unsubscribed._() : super._();

  @override
  Unsubscribed rebuild(void updates(UnsubscribedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UnsubscribedBuilder toBuilder() => new UnsubscribedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Unsubscribed;
  }

  @override
  int get hashCode {
    return 444864888;
  }
}

class UnsubscribedBuilder
    implements Builder<Unsubscribed, UnsubscribedBuilder> {
  _$Unsubscribed _$v;

  UnsubscribedBuilder();

  @override
  void replace(Unsubscribed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Unsubscribed;
  }

  @override
  void update(void updates(UnsubscribedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Unsubscribed build() {
    final _$result = _$v ?? new _$Unsubscribed._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoadExistingSubscription extends LoadExistingSubscription {
  factory _$LoadExistingSubscription(
          [void Function(LoadExistingSubscriptionBuilder) updates]) =>
      (new LoadExistingSubscriptionBuilder()..update(updates)).build();

  _$LoadExistingSubscription._() : super._();

  @override
  LoadExistingSubscription rebuild(
          void Function(LoadExistingSubscriptionBuilder) updates) =>
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
  void update(void Function(LoadExistingSubscriptionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoadExistingSubscription build() {
    final _$result = _$v ?? new _$LoadExistingSubscription._();
    replace(_$result);
    return _$result;
  }
}

class _$Subscribe extends Subscribe {
  @override
  final SubscriptionType subscriptionType;

  factory _$Subscribe([void Function(SubscribeBuilder) updates]) =>
      (new SubscribeBuilder()..update(updates)).build();

  _$Subscribe._({this.subscriptionType}) : super._() {
    if (subscriptionType == null) {
      throw new BuiltValueNullFieldError('Subscribe', 'subscriptionType');
    }
  }

  @override
  Subscribe rebuild(void Function(SubscribeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscribeBuilder toBuilder() => new SubscribeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Subscribe && subscriptionType == other.subscriptionType;
  }

  @override
  int get hashCode {
    return $jf($jc(0, subscriptionType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Subscribe')
          ..add('subscriptionType', subscriptionType))
        .toString();
  }
}

class SubscribeBuilder implements Builder<Subscribe, SubscribeBuilder> {
  _$Subscribe _$v;

  SubscriptionType _subscriptionType;
  SubscriptionType get subscriptionType => _$this._subscriptionType;
  set subscriptionType(SubscriptionType subscriptionType) =>
      _$this._subscriptionType = subscriptionType;

  SubscribeBuilder();

  SubscribeBuilder get _$this {
    if (_$v != null) {
      _subscriptionType = _$v.subscriptionType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Subscribe other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Subscribe;
  }

  @override
  void update(void Function(SubscribeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Subscribe build() {
    final _$result =
        _$v ?? new _$Subscribe._(subscriptionType: subscriptionType);
    replace(_$result);
    return _$result;
  }
}

class _$Unsubscribe extends Unsubscribe {
  factory _$Unsubscribe([void Function(UnsubscribeBuilder) updates]) =>
      (new UnsubscribeBuilder()..update(updates)).build();

  _$Unsubscribe._() : super._();

  @override
  Unsubscribe rebuild(void Function(UnsubscribeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnsubscribeBuilder toBuilder() => new UnsubscribeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Unsubscribe;
  }

  @override
  int get hashCode {
    return 130218988;
  }
}

class UnsubscribeBuilder implements Builder<Unsubscribe, UnsubscribeBuilder> {
  _$Unsubscribe _$v;

  UnsubscribeBuilder();

  @override
  void replace(Unsubscribe other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Unsubscribe;
  }

  @override
  void update(void Function(UnsubscribeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Unsubscribe build() {
    final _$result = _$v ?? new _$Unsubscribe._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

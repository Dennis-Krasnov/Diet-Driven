// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_edit_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Subscribe extends Subscribe {
  @override
  final SubscriptionType subscriptionType;
  @override
  final Completer<void> completer;

  factory _$Subscribe([void Function(SubscribeBuilder) updates]) =>
      (new SubscribeBuilder()..update(updates)).build();

  _$Subscribe._({this.subscriptionType, this.completer}) : super._() {
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
    return other is Subscribe &&
        subscriptionType == other.subscriptionType &&
        completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, subscriptionType.hashCode), completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Subscribe')
          ..add('subscriptionType', subscriptionType)
          ..add('completer', completer))
        .toString();
  }
}

class SubscribeBuilder implements Builder<Subscribe, SubscribeBuilder> {
  _$Subscribe _$v;

  SubscriptionType _subscriptionType;
  SubscriptionType get subscriptionType => _$this._subscriptionType;
  set subscriptionType(SubscriptionType subscriptionType) =>
      _$this._subscriptionType = subscriptionType;

  Completer<void> _completer;
  Completer<void> get completer => _$this._completer;
  set completer(Completer<void> completer) => _$this._completer = completer;

  SubscribeBuilder();

  SubscribeBuilder get _$this {
    if (_$v != null) {
      _subscriptionType = _$v.subscriptionType;
      _completer = _$v.completer;
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
    final _$result = _$v ??
        new _$Subscribe._(
            subscriptionType: subscriptionType, completer: completer);
    replace(_$result);
    return _$result;
  }
}

class _$Unsubscribe extends Unsubscribe {
  @override
  final Completer<void> completer;

  factory _$Unsubscribe([void Function(UnsubscribeBuilder) updates]) =>
      (new UnsubscribeBuilder()..update(updates)).build();

  _$Unsubscribe._({this.completer}) : super._();

  @override
  Unsubscribe rebuild(void Function(UnsubscribeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnsubscribeBuilder toBuilder() => new UnsubscribeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Unsubscribe && completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc(0, completer.hashCode));
  }
}

class UnsubscribeBuilder implements Builder<Unsubscribe, UnsubscribeBuilder> {
  _$Unsubscribe _$v;

  Completer<void> _completer;
  Completer<void> get completer => _$this._completer;
  set completer(Completer<void> completer) => _$this._completer = completer;

  UnsubscribeBuilder();

  UnsubscribeBuilder get _$this {
    if (_$v != null) {
      _completer = _$v.completer;
      _$v = null;
    }
    return this;
  }

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
    final _$result = _$v ?? new _$Unsubscribe._(completer: completer);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class LoggingEventBuilder {
  void replace(LoggingEvent other);
  void update(void Function(LoggingEventBuilder) updates);
  String get message;
  set message(String message);
}

class _$SendLogsToDeveloper extends SendLogsToDeveloper {
  @override
  final String message;

  factory _$SendLogsToDeveloper(
          [void Function(SendLogsToDeveloperBuilder) updates]) =>
      (new SendLogsToDeveloperBuilder()..update(updates)).build();

  _$SendLogsToDeveloper._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('SendLogsToDeveloper', 'message');
    }
  }

  @override
  SendLogsToDeveloper rebuild(
          void Function(SendLogsToDeveloperBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendLogsToDeveloperBuilder toBuilder() =>
      new SendLogsToDeveloperBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendLogsToDeveloper && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SendLogsToDeveloper')
          ..add('message', message))
        .toString();
  }
}

class SendLogsToDeveloperBuilder
    implements
        Builder<SendLogsToDeveloper, SendLogsToDeveloperBuilder>,
        LoggingEventBuilder {
  _$SendLogsToDeveloper _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  SendLogsToDeveloperBuilder();

  SendLogsToDeveloperBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SendLogsToDeveloper other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SendLogsToDeveloper;
  }

  @override
  void update(void Function(SendLogsToDeveloperBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SendLogsToDeveloper build() {
    final _$result = _$v ?? new _$SendLogsToDeveloper._(message: message);
    replace(_$result);
    return _$result;
  }
}

class _$LogError extends LogError {
  @override
  final ErrorLoggingLevel level;
  @override
  final Object error;
  @override
  final StackTrace stacktrace;
  @override
  final String message;

  factory _$LogError([void Function(LogErrorBuilder) updates]) =>
      (new LogErrorBuilder()..update(updates)).build();

  _$LogError._({this.level, this.error, this.stacktrace, this.message})
      : super._() {
    if (level == null) {
      throw new BuiltValueNullFieldError('LogError', 'level');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('LogError', 'error');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('LogError', 'message');
    }
  }

  @override
  LogError rebuild(void Function(LogErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogErrorBuilder toBuilder() => new LogErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogError &&
        level == other.level &&
        error == other.error &&
        stacktrace == other.stacktrace &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, level.hashCode), error.hashCode), stacktrace.hashCode),
        message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LogError')
          ..add('level', level)
          ..add('error', error)
          ..add('stacktrace', stacktrace)
          ..add('message', message))
        .toString();
  }
}

class LogErrorBuilder
    implements Builder<LogError, LogErrorBuilder>, LoggingEventBuilder {
  _$LogError _$v;

  ErrorLoggingLevel _level;
  ErrorLoggingLevel get level => _$this._level;
  set level(ErrorLoggingLevel level) => _$this._level = level;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  StackTrace _stacktrace;
  StackTrace get stacktrace => _$this._stacktrace;
  set stacktrace(StackTrace stacktrace) => _$this._stacktrace = stacktrace;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  LogErrorBuilder();

  LogErrorBuilder get _$this {
    if (_$v != null) {
      _level = _$v.level;
      _error = _$v.error;
      _stacktrace = _$v.stacktrace;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LogError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LogError;
  }

  @override
  void update(void Function(LogErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LogError build() {
    final _$result = _$v ??
        new _$LogError._(
            level: level,
            error: error,
            stacktrace: stacktrace,
            message: message);
    replace(_$result);
    return _$result;
  }
}

class _$LogMessage extends LogMessage {
  @override
  final MessageLoggingLevel level;
  @override
  final String message;

  factory _$LogMessage([void Function(LogMessageBuilder) updates]) =>
      (new LogMessageBuilder()..update(updates)).build();

  _$LogMessage._({this.level, this.message}) : super._() {
    if (level == null) {
      throw new BuiltValueNullFieldError('LogMessage', 'level');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('LogMessage', 'message');
    }
  }

  @override
  LogMessage rebuild(void Function(LogMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogMessageBuilder toBuilder() => new LogMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogMessage &&
        level == other.level &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, level.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LogMessage')
          ..add('level', level)
          ..add('message', message))
        .toString();
  }
}

class LogMessageBuilder
    implements Builder<LogMessage, LogMessageBuilder>, LoggingEventBuilder {
  _$LogMessage _$v;

  MessageLoggingLevel _level;
  MessageLoggingLevel get level => _$this._level;
  set level(MessageLoggingLevel level) => _$this._level = level;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  LogMessageBuilder();

  LogMessageBuilder get _$this {
    if (_$v != null) {
      _level = _$v.level;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LogMessage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LogMessage;
  }

  @override
  void update(void Function(LogMessageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LogMessage build() {
    final _$result = _$v ?? new _$LogMessage._(level: level, message: message);
    replace(_$result);
    return _$result;
  }
}

class _$LogBlocTransition extends LogBlocTransition {
  @override
  final Built<Built, Builder> currentState;
  @override
  final Built<Built, Builder> event;
  @override
  final Built<Built, Builder> nextState;
  @override
  final String message;

  factory _$LogBlocTransition(
          [void Function(LogBlocTransitionBuilder) updates]) =>
      (new LogBlocTransitionBuilder()..update(updates)).build();

  _$LogBlocTransition._(
      {this.currentState, this.event, this.nextState, this.message})
      : super._() {
    if (currentState == null) {
      throw new BuiltValueNullFieldError('LogBlocTransition', 'currentState');
    }
    if (event == null) {
      throw new BuiltValueNullFieldError('LogBlocTransition', 'event');
    }
    if (nextState == null) {
      throw new BuiltValueNullFieldError('LogBlocTransition', 'nextState');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('LogBlocTransition', 'message');
    }
  }

  @override
  LogBlocTransition rebuild(void Function(LogBlocTransitionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogBlocTransitionBuilder toBuilder() =>
      new LogBlocTransitionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogBlocTransition &&
        currentState == other.currentState &&
        event == other.event &&
        nextState == other.nextState &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, currentState.hashCode), event.hashCode),
            nextState.hashCode),
        message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LogBlocTransition')
          ..add('currentState', currentState)
          ..add('event', event)
          ..add('nextState', nextState)
          ..add('message', message))
        .toString();
  }
}

class LogBlocTransitionBuilder
    implements
        Builder<LogBlocTransition, LogBlocTransitionBuilder>,
        LoggingEventBuilder {
  _$LogBlocTransition _$v;

  Built<Built, Builder> _currentState;
  Built<Built, Builder> get currentState => _$this._currentState;
  set currentState(Built<Built, Builder> currentState) =>
      _$this._currentState = currentState;

  Built<Built, Builder> _event;
  Built<Built, Builder> get event => _$this._event;
  set event(Built<Built, Builder> event) => _$this._event = event;

  Built<Built, Builder> _nextState;
  Built<Built, Builder> get nextState => _$this._nextState;
  set nextState(Built<Built, Builder> nextState) =>
      _$this._nextState = nextState;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  LogBlocTransitionBuilder();

  LogBlocTransitionBuilder get _$this {
    if (_$v != null) {
      _currentState = _$v.currentState;
      _event = _$v.event;
      _nextState = _$v.nextState;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LogBlocTransition other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LogBlocTransition;
  }

  @override
  void update(void Function(LogBlocTransitionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LogBlocTransition build() {
    final _$result = _$v ??
        new _$LogBlocTransition._(
            currentState: currentState,
            event: event,
            nextState: nextState,
            message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

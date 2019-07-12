// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MessageLoggingLevel _$verbose = const MessageLoggingLevel._('verbose');
const MessageLoggingLevel _$debug = const MessageLoggingLevel._('debug');
const MessageLoggingLevel _$info = const MessageLoggingLevel._('info');
const MessageLoggingLevel _$warning = const MessageLoggingLevel._('warning');
const MessageLoggingLevel _$error = const MessageLoggingLevel._('error');

MessageLoggingLevel _$messageValueOf(String name) {
  switch (name) {
    case 'verbose':
      return _$verbose;
    case 'debug':
      return _$debug;
    case 'info':
      return _$info;
    case 'warning':
      return _$warning;
    case 'error':
      return _$error;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MessageLoggingLevel> _$messageValues =
    new BuiltSet<MessageLoggingLevel>(const <MessageLoggingLevel>[
  _$verbose,
  _$debug,
  _$info,
  _$warning,
  _$error,
]);

const ErrorLoggingLevel _$expected = const ErrorLoggingLevel._('expected');
const ErrorLoggingLevel _$unexpected = const ErrorLoggingLevel._('unexpected');

ErrorLoggingLevel _$errorValueOf(String name) {
  switch (name) {
    case 'expected':
      return _$expected;
    case 'unexpected':
      return _$unexpected;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ErrorLoggingLevel> _$errorValues =
    new BuiltSet<ErrorLoggingLevel>(const <ErrorLoggingLevel>[
  _$expected,
  _$unexpected,
]);

Serializer<MessageLoggingLevel> _$messageLoggingLevelSerializer =
    new _$MessageLoggingLevelSerializer();
Serializer<ErrorLoggingLevel> _$errorLoggingLevelSerializer =
    new _$ErrorLoggingLevelSerializer();

class _$MessageLoggingLevelSerializer
    implements PrimitiveSerializer<MessageLoggingLevel> {
  @override
  final Iterable<Type> types = const <Type>[MessageLoggingLevel];
  @override
  final String wireName = 'MessageLoggingLevel';

  @override
  Object serialize(Serializers serializers, MessageLoggingLevel object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  MessageLoggingLevel deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MessageLoggingLevel.valueOf(serialized as String);
}

class _$ErrorLoggingLevelSerializer
    implements PrimitiveSerializer<ErrorLoggingLevel> {
  @override
  final Iterable<Type> types = const <Type>[ErrorLoggingLevel];
  @override
  final String wireName = 'ErrorLoggingLevel';

  @override
  Object serialize(Serializers serializers, ErrorLoggingLevel object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ErrorLoggingLevel deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ErrorLoggingLevel.valueOf(serialized as String);
}

class _$LoggingState extends LoggingState {
  @override
  final BuiltList<Log> logs;

  factory _$LoggingState([void Function(LoggingStateBuilder) updates]) =>
      (new LoggingStateBuilder()..update(updates)).build();

  _$LoggingState._({this.logs}) : super._() {
    if (logs == null) {
      throw new BuiltValueNullFieldError('LoggingState', 'logs');
    }
  }

  @override
  LoggingState rebuild(void Function(LoggingStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoggingStateBuilder toBuilder() => new LoggingStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoggingState && logs == other.logs;
  }

  @override
  int get hashCode {
    return $jf($jc(0, logs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoggingState')..add('logs', logs))
        .toString();
  }
}

class LoggingStateBuilder
    implements Builder<LoggingState, LoggingStateBuilder> {
  _$LoggingState _$v;

  ListBuilder<Log> _logs;
  ListBuilder<Log> get logs => _$this._logs ??= new ListBuilder<Log>();
  set logs(ListBuilder<Log> logs) => _$this._logs = logs;

  LoggingStateBuilder();

  LoggingStateBuilder get _$this {
    if (_$v != null) {
      _logs = _$v.logs?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoggingState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoggingState;
  }

  @override
  void update(void Function(LoggingStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoggingState build() {
    _$LoggingState _$result;
    try {
      _$result = _$v ?? new _$LoggingState._(logs: logs.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'logs';
        logs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoggingState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract class LogBuilder {
  void replace(Log other);
  void update(void Function(LogBuilder) updates);
  String get message;
  set message(String message);

  DateTime get datetime;
  set datetime(DateTime datetime);
}

class _$MessageLog extends MessageLog {
  @override
  final MessageLoggingLevel level;
  @override
  final String message;
  @override
  final DateTime datetime;

  factory _$MessageLog([void Function(MessageLogBuilder) updates]) =>
      (new MessageLogBuilder()..update(updates)).build();

  _$MessageLog._({this.level, this.message, this.datetime}) : super._() {
    if (level == null) {
      throw new BuiltValueNullFieldError('MessageLog', 'level');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('MessageLog', 'message');
    }
    if (datetime == null) {
      throw new BuiltValueNullFieldError('MessageLog', 'datetime');
    }
  }

  @override
  MessageLog rebuild(void Function(MessageLogBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageLogBuilder toBuilder() => new MessageLogBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageLog &&
        level == other.level &&
        message == other.message &&
        datetime == other.datetime;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, level.hashCode), message.hashCode), datetime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageLog')
          ..add('level', level)
          ..add('message', message)
          ..add('datetime', datetime))
        .toString();
  }
}

class MessageLogBuilder
    implements Builder<MessageLog, MessageLogBuilder>, LogBuilder {
  _$MessageLog _$v;

  MessageLoggingLevel _level;
  MessageLoggingLevel get level => _$this._level;
  set level(MessageLoggingLevel level) => _$this._level = level;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  DateTime _datetime;
  DateTime get datetime => _$this._datetime;
  set datetime(DateTime datetime) => _$this._datetime = datetime;

  MessageLogBuilder();

  MessageLogBuilder get _$this {
    if (_$v != null) {
      _level = _$v.level;
      _message = _$v.message;
      _datetime = _$v.datetime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant MessageLog other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MessageLog;
  }

  @override
  void update(void Function(MessageLogBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageLog build() {
    final _$result = _$v ??
        new _$MessageLog._(level: level, message: message, datetime: datetime);
    replace(_$result);
    return _$result;
  }
}

class _$ErrorLog extends ErrorLog {
  @override
  final ErrorLoggingLevel level;
  @override
  final Object error;
  @override
  final StackTrace stacktrace;
  @override
  final String message;
  @override
  final DateTime datetime;

  factory _$ErrorLog([void Function(ErrorLogBuilder) updates]) =>
      (new ErrorLogBuilder()..update(updates)).build();

  _$ErrorLog._(
      {this.level, this.error, this.stacktrace, this.message, this.datetime})
      : super._() {
    if (level == null) {
      throw new BuiltValueNullFieldError('ErrorLog', 'level');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('ErrorLog', 'error');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('ErrorLog', 'message');
    }
    if (datetime == null) {
      throw new BuiltValueNullFieldError('ErrorLog', 'datetime');
    }
  }

  @override
  ErrorLog rebuild(void Function(ErrorLogBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorLogBuilder toBuilder() => new ErrorLogBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorLog &&
        level == other.level &&
        error == other.error &&
        stacktrace == other.stacktrace &&
        message == other.message &&
        datetime == other.datetime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, level.hashCode), error.hashCode),
                stacktrace.hashCode),
            message.hashCode),
        datetime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ErrorLog')
          ..add('level', level)
          ..add('error', error)
          ..add('stacktrace', stacktrace)
          ..add('message', message)
          ..add('datetime', datetime))
        .toString();
  }
}

class ErrorLogBuilder
    implements Builder<ErrorLog, ErrorLogBuilder>, LogBuilder {
  _$ErrorLog _$v;

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

  DateTime _datetime;
  DateTime get datetime => _$this._datetime;
  set datetime(DateTime datetime) => _$this._datetime = datetime;

  ErrorLogBuilder();

  ErrorLogBuilder get _$this {
    if (_$v != null) {
      _level = _$v.level;
      _error = _$v.error;
      _stacktrace = _$v.stacktrace;
      _message = _$v.message;
      _datetime = _$v.datetime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ErrorLog other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ErrorLog;
  }

  @override
  void update(void Function(ErrorLogBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ErrorLog build() {
    final _$result = _$v ??
        new _$ErrorLog._(
            level: level,
            error: error,
            stacktrace: stacktrace,
            message: message,
            datetime: datetime);
    replace(_$result);
    return _$result;
  }
}

class _$BlocTransitionLog extends BlocTransitionLog {
  @override
  final Built<Built, Builder> currentState;
  @override
  final Built<Built, Builder> event;
  @override
  final Built<Built, Builder> nextState;
  @override
  final String message;
  @override
  final DateTime datetime;

  factory _$BlocTransitionLog(
          [void Function(BlocTransitionLogBuilder) updates]) =>
      (new BlocTransitionLogBuilder()..update(updates)).build();

  _$BlocTransitionLog._(
      {this.currentState,
      this.event,
      this.nextState,
      this.message,
      this.datetime})
      : super._() {
    if (currentState == null) {
      throw new BuiltValueNullFieldError('BlocTransitionLog', 'currentState');
    }
    if (event == null) {
      throw new BuiltValueNullFieldError('BlocTransitionLog', 'event');
    }
    if (nextState == null) {
      throw new BuiltValueNullFieldError('BlocTransitionLog', 'nextState');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('BlocTransitionLog', 'message');
    }
    if (datetime == null) {
      throw new BuiltValueNullFieldError('BlocTransitionLog', 'datetime');
    }
  }

  @override
  BlocTransitionLog rebuild(void Function(BlocTransitionLogBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BlocTransitionLogBuilder toBuilder() =>
      new BlocTransitionLogBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BlocTransitionLog &&
        currentState == other.currentState &&
        event == other.event &&
        nextState == other.nextState &&
        message == other.message &&
        datetime == other.datetime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, currentState.hashCode), event.hashCode),
                nextState.hashCode),
            message.hashCode),
        datetime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BlocTransitionLog')
          ..add('currentState', currentState)
          ..add('event', event)
          ..add('nextState', nextState)
          ..add('message', message)
          ..add('datetime', datetime))
        .toString();
  }
}

class BlocTransitionLogBuilder
    implements
        Builder<BlocTransitionLog, BlocTransitionLogBuilder>,
        LogBuilder {
  _$BlocTransitionLog _$v;

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

  DateTime _datetime;
  DateTime get datetime => _$this._datetime;
  set datetime(DateTime datetime) => _$this._datetime = datetime;

  BlocTransitionLogBuilder();

  BlocTransitionLogBuilder get _$this {
    if (_$v != null) {
      _currentState = _$v.currentState;
      _event = _$v.event;
      _nextState = _$v.nextState;
      _message = _$v.message;
      _datetime = _$v.datetime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BlocTransitionLog other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BlocTransitionLog;
  }

  @override
  void update(void Function(BlocTransitionLogBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BlocTransitionLog build() {
    final _$result = _$v ??
        new _$BlocTransitionLog._(
            currentState: currentState,
            event: event,
            nextState: nextState,
            message: message,
            datetime: datetime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

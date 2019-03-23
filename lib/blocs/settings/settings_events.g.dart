// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SettingsDocumentsArrived extends SettingsDocumentsArrived {
  @override
  final BuiltList<SettingsDocument> settingsDocuments;

  factory _$SettingsDocumentsArrived(
          [void updates(SettingsDocumentsArrivedBuilder b)]) =>
      (new SettingsDocumentsArrivedBuilder()..update(updates)).build();

  _$SettingsDocumentsArrived._({this.settingsDocuments}) : super._() {
    if (settingsDocuments == null) {
      throw new BuiltValueNullFieldError(
          'SettingsDocumentsArrived', 'settingsDocuments');
    }
  }

  @override
  SettingsDocumentsArrived rebuild(
          void updates(SettingsDocumentsArrivedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsDocumentsArrivedBuilder toBuilder() =>
      new SettingsDocumentsArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsDocumentsArrived &&
        settingsDocuments == other.settingsDocuments;
  }

  @override
  int get hashCode {
    return $jf($jc(0, settingsDocuments.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsDocumentsArrived')
          ..add('settingsDocuments', settingsDocuments))
        .toString();
  }
}

class SettingsDocumentsArrivedBuilder
    implements
        Builder<SettingsDocumentsArrived, SettingsDocumentsArrivedBuilder> {
  _$SettingsDocumentsArrived _$v;

  ListBuilder<SettingsDocument> _settingsDocuments;
  ListBuilder<SettingsDocument> get settingsDocuments =>
      _$this._settingsDocuments ??= new ListBuilder<SettingsDocument>();
  set settingsDocuments(ListBuilder<SettingsDocument> settingsDocuments) =>
      _$this._settingsDocuments = settingsDocuments;

  SettingsDocumentsArrivedBuilder();

  SettingsDocumentsArrivedBuilder get _$this {
    if (_$v != null) {
      _settingsDocuments = _$v.settingsDocuments?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsDocumentsArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SettingsDocumentsArrived;
  }

  @override
  void update(void updates(SettingsDocumentsArrivedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsDocumentsArrived build() {
    _$SettingsDocumentsArrived _$result;
    try {
      _$result = _$v ??
          new _$SettingsDocumentsArrived._(
              settingsDocuments: settingsDocuments.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'settingsDocuments';
        settingsDocuments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SettingsDocumentsArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

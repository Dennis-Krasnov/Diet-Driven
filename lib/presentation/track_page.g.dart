// GENERATED CODE - DO NOT MODIFY BY HAND

part of track_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TrackPageVM extends TrackPageVM {
  @override
  final FirebaseUser user;

  factory _$TrackPageVM([void updates(TrackPageVMBuilder b)]) =>
      (new TrackPageVMBuilder()..update(updates)).build();

  _$TrackPageVM._({this.user}) : super._();

  @override
  TrackPageVM rebuild(void updates(TrackPageVMBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackPageVMBuilder toBuilder() => new TrackPageVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrackPageVM && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TrackPageVM')..add('user', user))
        .toString();
  }
}

class TrackPageVMBuilder implements Builder<TrackPageVM, TrackPageVMBuilder> {
  _$TrackPageVM _$v;

  FirebaseUser _user;
  FirebaseUser get user => _$this._user;
  set user(FirebaseUser user) => _$this._user = user;

  TrackPageVMBuilder();

  TrackPageVMBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TrackPageVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TrackPageVM;
  }

  @override
  void update(void updates(TrackPageVMBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TrackPageVM build() {
    final _$result = _$v ?? new _$TrackPageVM._(user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

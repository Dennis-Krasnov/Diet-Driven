library settings_state;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'settings_state.g.dart';

///
abstract class SettingsState implements Built<SettingsState, SettingsStateBuilder> {
  static Serializer<SettingsState> get serializer => _$settingsStateSerializer;

//  @BuiltValueField(serialize: true, compare: false, wireName: "_id")
//  @nullable
//  String get id;



  factory SettingsState([updates(SettingsStateBuilder b)]) = _$SettingsState;

  SettingsState._();
}

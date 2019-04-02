import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'settings_events.g.dart';

abstract class SettingsEvent {}

///
abstract class SettingsArrived with SettingsEvent implements Built<SettingsArrived, SettingsArrivedBuilder> {
  Settings get settings;

  SettingsArrived._();
  factory SettingsArrived([updates(SettingsArrivedBuilder b)]) = _$SettingsArrived;
}

///
abstract class WipeSettings with SettingsEvent implements Built<WipeSettings, WipeSettingsBuilder> {
  WipeSettings._();
  factory WipeSettings([updates(WipeSettingsBuilder b)]) = _$WipeSettings;

  @override
  String toString() => runtimeType.toString();
}

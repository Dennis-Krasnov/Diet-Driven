import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'settings_events.g.dart';

abstract class SettingsEvent {}

///
abstract class RemoteSettingsArrived with SettingsEvent implements Built<RemoteSettingsArrived, RemoteSettingsArrivedBuilder> {
  Settings get settings;

  RemoteSettingsArrived._();
  factory RemoteSettingsArrived([updates(RemoteSettingsArrivedBuilder b)]) = _$RemoteSettingsArrived;
}

///
abstract class SettingsError with SettingsEvent implements Built<SettingsError, SettingsErrorBuilder> {
  String get error;

  SettingsError._();
  factory SettingsError([updates(SettingsErrorBuilder b)]) = _$SettingsError;
}

///
abstract class WipeSettings with SettingsEvent implements Built<WipeSettings, WipeSettingsBuilder> {
  WipeSettings._();
  factory WipeSettings([updates(WipeSettingsBuilder b)]) = _$WipeSettings;
}

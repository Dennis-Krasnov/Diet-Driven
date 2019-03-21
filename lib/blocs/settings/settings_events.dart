import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'settings_events.g.dart';

abstract class SettingsEvent {}

abstract class LoadInitialSettings with SettingsEvent implements Built<LoadInitialSettings, LoadInitialSettingsBuilder> {
  String get userId;

  LoadInitialSettings._();
  factory LoadInitialSettings([updates(LoadInitialSettingsBuilder b)]) = _$LoadInitialSettings;
}

abstract class UserDataArrived with SettingsEvent implements Built<UserDataArrived, UserDataArrivedBuilder> {
  UserData get userData;

  UserDataArrived._();
  factory UserDataArrived([updates(UserDataArrivedBuilder b)]) = _$UserDataArrived;
}

abstract class SettingsDocumentsArrived with SettingsEvent implements Built<SettingsDocumentsArrived, SettingsDocumentsArrivedBuilder> {
  BuiltList<SettingsDocument> get settingsDocuments;

  SettingsDocumentsArrived._();
  factory SettingsDocumentsArrived([updates(SettingsDocumentsArrivedBuilder b)]) = _$SettingsDocumentsArrived;
}

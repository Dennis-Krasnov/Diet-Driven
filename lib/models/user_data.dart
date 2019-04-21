import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:diet_driven/models/models.dart';

part 'user_data.g.dart';

abstract class UserData implements Built<UserData, UserDataBuilder> {
  static Serializer<UserData> get serializer => _$userDataSerializer;

  /// Authentication
  @nullable
  String get userId;

  @nullable
  String get email;

  @nullable
  String get name;

  /// User Document
  String get currentSubscription;

//  TODO: accepted terms, etc!

  /// Settings
  Settings get settings;
  // TODO: single document!

  UserData._();
  factory UserData([updates(UserDataBuilder b)]) = _$UserData;
}

abstract class UserDataBuilder implements Builder<UserData, UserDataBuilder> {
  String userId;
  @nullable
  String email;
  @nullable
  String name;

  String currentSubscription = "none";

  Settings settings;

  factory UserDataBuilder() = _$UserDataBuilder;
  UserDataBuilder._();
}

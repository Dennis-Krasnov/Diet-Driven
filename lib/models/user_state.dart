library user_state;

import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/data/subscriptions.dart';
import 'package:diet_driven/util/built_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_state.g.dart';


// TODO: UserDocument(harcoded_subpath: "settings/navigatoin") named param!!!! this simplifies a lot of things!!!! - move this to userState!!! straight up remove settingsState... unnecessary encapsulation!

abstract class UserState implements Built<UserState, UserStateBuilder> {
  /*
  User's current Firebase Authentication instance.

  Duration app init:

  During logout:

   */
  @BuiltValueField(serialize: false)
  @nullable
  FirebaseUser get authUser;

  // The following data is read-only via firestore security rules:

  /*
  Used for propagating Remote Config updates in real time without the use of cloud messaging.

  During app init:
  => Fetches Firebase remote config if its expired,
     App calls cloud function to sets user's Firestore staleRemoteConfig to false

  During app use:
  => Developer updates Remote config from Firebase console
  => Cloud functions remote config trigger sets user's Firestore staleRemoteConfig to true
  => Firestore subscription updates userState
  => Middleware fetches Firebase remote config if staleRemoteConfig is now true,
     App calls cloud function to sets user's Firestore staleRemoteConfig to false

  Limitations:
  - If config is updated updated while app isn't running AND remote config hasn't yet expired,
  then use won't receive update until their remote config expires.
  - Executes a cloud function and firestore write on every app init.
   */
  bool get staleRemoteConfig;


  /*
  User's current subscription status, doesn't include any billing details.

  Lifecycle:
  => Firestore subscription_history document created by any of:
     - Direct in-app action
     - Cloud functions webhook trigger on Play Store or App Store subscription status change
     - Manual admin edit through Firestore console
  => Cloud functions firestore create trigger sets user's Firestore currentSubscription to updated status,
     Sets user's Firestore Authentication custom claim to updated status (used for Firestore security rules only)
  => Firestore subscription updates userState
  => Middleware displays "welcome to ___ plan" or "sorry to see you go" dialog on respective currentSubscription change
   */
  SubscriptionType get currentSubscription;

  UserState._();
  factory UserState([updates(UserStateBuilder b)]) = _$UserState;
}

abstract class UserStateBuilder implements Builder<UserState, UserStateBuilder> {
  @nullable
  FirebaseUser authUser;

  bool staleRemoteConfig = false;

  SubscriptionType currentSubscription = SubscriptionType.none;

  factory UserStateBuilder() = _$UserStateBuilder;
  UserStateBuilder._();
}


/// TODO: just use generic UserDocument - no, still need to specify /navigation
abstract class UserStateDocument with FSDocument<dynamic> implements Built<UserStateDocument, UserStateDocumentBuilder> {
  @nullable
  String get userId;

  @nullable
  String get subPath;

  String generateSubPath() => subPath == null ? "" : "/$subPath";

  @override
  DocumentReference get docRef => Firestore.instance.document("users/$userId${generateSubPath()}");

  UserStateDocument._();
  factory UserStateDocument([updates(UserStateDocumentBuilder b)]) = _$UserStateDocument;
}


//abstract class UserStateDocumentBuilder implements Builder<UserStateDocument, UserStateDocumentBuilder> {
//  @nullable
//  String userId;
//
//  String subPath = "";
//
//  @nullable
//  @BuiltValueField(serialize: false, compare: false)
//  StreamSubscription streamSubscription;
//
//  factory UserStateDocumentBuilder() = _$UserStateDocumentBuilder;
//  UserStateDocumentBuilder._();
//}

abstract class SettingsDocument {}

abstract class SettingsCollection with FSCollection<SettingsDocument> implements Built<SettingsCollection, SettingsCollectionBuilder> {
  @nullable
  String get userId;

  @override
  CollectionReference get colRef => Firestore.instance.collection("users/$userId/settings");

  SettingsCollection._();
  factory SettingsCollection([updates(SettingsCollectionBuilder b)]) = _$SettingsCollection;
}
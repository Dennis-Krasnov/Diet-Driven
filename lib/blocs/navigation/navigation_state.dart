import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'navigation_state.g.dart';

abstract class NavigationState {
  @nullable
  Page get page;
}

/// White screen with skeleton menu and app bar
abstract class NavigationUninitialized with NavigationState implements Built<NavigationUninitialized, NavigationUninitializedBuilder> {
  factory NavigationUninitialized([void Function(NavigationUninitializedBuilder b)]) = _$NavigationUninitialized;
  NavigationUninitialized._();

  @override String toString() => runtimeType.toString();
}

abstract class DiaryTab with NavigationState implements Built<DiaryTab, DiaryTabBuilder> {
  @override
  Page get page => Page.diary;

  ///
  @nullable
  int get date;

  factory DiaryTab([void Function(DiaryTabBuilder) updates]) = _$DiaryTab;
  DiaryTab._();
}

abstract class TrackTab with NavigationState implements Built<TrackTab, TrackTabBuilder> {
  @override
  Page get page => Page.track;

  factory TrackTab([void Function(TrackTabBuilder) updates]) = _$TrackTab;
  TrackTab._();
}

abstract class DietTab with NavigationState implements Built<DietTab, DietTabBuilder> {
  @override
  Page get page => Page.diet;

  factory DietTab([void Function(DietTabBuilder) updates]) = _$DietTab;
  DietTab._();
}

abstract class ProfileTab with NavigationState implements Built<ProfileTab, ProfileTabBuilder> {
  @override
  Page get page => Page.profile;


  @nullable
  String get setting;

  factory ProfileTab([void Function(ProfileTabBuilder) updates]) = _$ProfileTab;
  ProfileTab._();
}

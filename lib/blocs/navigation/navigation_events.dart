import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'navigation_events.g.dart';

// TODO: create a live template for this
@BuiltValue(instantiable: false)
abstract class NavigationEvent {
  bool get onlyIfUninitialized;

  NavigationEvent rebuild(void Function(NavigationEventBuilder) updates);
  NavigationEventBuilder toBuilder();
}

/// Deep link to diary page.
abstract class NavigateToDiary implements NavigationEvent, Built<NavigateToDiary, NavigateToDiaryBuilder> {
  ///
  @nullable
  int get date;

  factory NavigateToDiary([void Function(NavigateToDiaryBuilder) updates]) = _$NavigateToDiary;
  NavigateToDiary._();
}

abstract class NavigateToDiaryBuilder implements NavigationEventBuilder, Builder<NavigateToDiary, NavigateToDiaryBuilder> {
  @override
  bool onlyIfUninitialized = false;

  @nullable
  int date;

  factory NavigateToDiaryBuilder() = _$NavigateToDiaryBuilder;
  NavigateToDiaryBuilder._();
}


/// Deep link to tracking page.
abstract class NavigateToTrack implements NavigationEvent, Built<NavigateToTrack, NavigateToTrackBuilder> {
  factory NavigateToTrack([void Function(NavigateToTrackBuilder) updates]) = _$NavigateToTrack;
  NavigateToTrack._();
}

abstract class NavigateToTrackBuilder implements NavigationEventBuilder, Builder<NavigateToTrack, NavigateToTrackBuilder> {
  @override
  bool onlyIfUninitialized = false;

  factory NavigateToTrackBuilder() = _$NavigateToTrackBuilder;
  NavigateToTrackBuilder._();
}


/// Deep link to diet page.
abstract class NavigateToDiet implements NavigationEvent, Built<NavigateToDiet, NavigateToDietBuilder> {
  factory NavigateToDiet([void Function(NavigateToDietBuilder) updates]) = _$NavigateToDiet;
  NavigateToDiet._();
}

abstract class NavigateToDietBuilder implements NavigationEventBuilder, Builder<NavigateToDiet, NavigateToDietBuilder> {
  @override
  bool onlyIfUninitialized = false;

  factory NavigateToDietBuilder() = _$NavigateToDietBuilder;
  NavigateToDietBuilder._();
}


/// Deep link to profile page.
abstract class NavigateToProfile implements NavigationEvent, Built<NavigateToProfile, NavigateToProfileBuilder> {
  @nullable
  String get setting; // TODO: enum

  factory NavigateToProfile([void Function(NavigateToProfileBuilder) updates]) = _$NavigateToProfile;
  NavigateToProfile._();
}

abstract class NavigateToProfileBuilder implements NavigationEventBuilder, Builder<NavigateToProfile, NavigateToProfileBuilder> {
  @override
  bool onlyIfUninitialized = false;

  @nullable
  String setting;

  factory NavigateToProfileBuilder() = _$NavigateToProfileBuilder;
  NavigateToProfileBuilder._();
}

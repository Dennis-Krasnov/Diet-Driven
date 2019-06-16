import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'navigation_events.g.dart';

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

/// Deep link to tracking page.
abstract class NavigateToTrack implements NavigationEvent, Built<NavigateToTrack, NavigateToTrackBuilder> {


  factory NavigateToTrack([void Function(NavigateToTrackBuilder) updates]) = _$NavigateToTrack;
  NavigateToTrack._();
}

/// Deep link to diet page.
abstract class NavigateToDiet implements NavigationEvent, Built<NavigateToDiet, NavigateToDietBuilder> {


  factory NavigateToDiet([void Function(NavigateToDietBuilder) updates]) = _$NavigateToDiet;
  NavigateToDiet._();
}

/// Deep link to profile page.
abstract class NavigateToProfile implements NavigationEvent, Built<NavigateToProfile, NavigateToProfileBuilder> {
  @nullable
  String get setting;
  // TODO: settings enum

  factory NavigateToProfile([void Function(NavigateToProfileBuilder) updates]) = _$NavigateToProfile;
  NavigateToProfile._();
}

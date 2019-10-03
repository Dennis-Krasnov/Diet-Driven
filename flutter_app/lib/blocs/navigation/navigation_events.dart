/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/blocs/navigation/navigation.dart';

part 'navigation_events.g.dart';

@BuiltValue(instantiable: false)
abstract class NavigationEvent {
  @nullable
  BuiltList<DeepLink> get deepLink;

  NavigationEvent rebuild(void Function(NavigationEventBuilder) updates);
  NavigationEventBuilder toBuilder();
}

/// Subscribes to bloc state stream, navigates to default page.
/// Doesn't use [deepLink] and [fullPage] fields.
abstract class InitNavigation implements NavigationEvent, Built<InitNavigation, InitNavigationBuilder> {
  factory InitNavigation([void Function(InitNavigationBuilder) updates]) = _$InitNavigation;
  InitNavigation._();
}

/// Navigate to diary tab.
abstract class NavigateToDiary implements NavigationEvent, Built<NavigateToDiary, NavigateToDiaryBuilder> {
  factory NavigateToDiary([void Function(NavigateToDiaryBuilder) updates]) = _$NavigateToDiary;
  NavigateToDiary._();

  /// Hard reset sub navigation.
  factory NavigateToDiary.root() => NavigateToDiary((b) => b
    ..deepLink = ListBuilder()
  );

  /// Convenience constructor for diary on [date].
  factory NavigateToDiary.day(int date) => NavigateToDiary((b) => b
    ..deepLink = ListBuilder(<DeepLink>[ValueDeepLink<int>((b) => b
      ..path = "diary"
      ..data = date
    )])
  );
}

/// Navigate to track tab.
abstract class NavigateToTrack implements NavigationEvent, Built<NavigateToTrack, NavigateToTrackBuilder> {
  factory NavigateToTrack([void Function(NavigateToTrackBuilder) updates]) = _$NavigateToTrack;
  NavigateToTrack._();
}

/// Navigate to reports tab.
abstract class NavigateToReports implements NavigationEvent, Built<NavigateToReports, NavigateToReportsBuilder> {
  factory NavigateToReports([void Function(NavigateToReportsBuilder) updates]) = _$NavigateToReports;
  NavigateToReports._();
}

/// Navigate to settings tab.
abstract class NavigateToSettings implements NavigationEvent, Built<NavigateToSettings, NavigateToSettingsBuilder> {
  factory NavigateToSettings([void Function(NavigateToSettingsBuilder) updates]) = _$NavigateToSettings;
  NavigateToSettings._();

  ///
  factory NavigateToSettings.root() => NavigateToSettings((b) => b
    ..deepLink = ListBuilder()
  );

  /// ...
  factory NavigateToSettings.general() => NavigateToSettings((b) => b
    ..deepLink = ListBuilder(<DeepLink>[PathDeepLink((b) => b..path = "general")])
  );

  ///
  factory NavigateToSettings.theme() => NavigateToSettings((b) => b
    ..deepLink = ListBuilder(<DeepLink>[PathDeepLink((b) => b..path = "theme")])
  );

  ///
  factory NavigateToSettings.diary() => NavigateToSettings((b) => b
    ..deepLink = ListBuilder(<DeepLink>[PathDeepLink((b) => b..path = "diary")])
  );
}

/// Navigate to logging tab.
abstract class NavigateToLogging implements NavigationEvent, Built<NavigateToLogging, NavigateToLoggingBuilder> {
  factory NavigateToLogging([void Function(NavigateToLoggingBuilder) updates]) = _$NavigateToLogging;
  NavigateToLogging._();
}

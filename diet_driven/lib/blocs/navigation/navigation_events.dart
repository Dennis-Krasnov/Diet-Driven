import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'navigation_events.g.dart';


/// Base class for all deep links.
abstract class DeepLink {}

// TODO: create a live template for non-instantiable built values
@BuiltValue(instantiable: false)
abstract class NavigationEvent {
  /// Navigates only if navigation bloc is currently uninitialized.
  /// Used to navigate to default page on app on launch.
  bool get onlyIfUninitialized;

  NavigationEvent rebuild(void Function(NavigationEventBuilder) updates);
  NavigationEventBuilder toBuilder();
}

/// Remove deep link from navigation state.
abstract class ClearDeepLink implements NavigationEvent, Built<ClearDeepLink, ClearDeepLinkBuilder> {
  factory ClearDeepLink([void Function(ClearDeepLinkBuilder) updates]) = _$ClearDeepLink;
  ClearDeepLink._();
}

abstract class ClearDeepLinkBuilder implements NavigationEventBuilder, Builder<ClearDeepLink, ClearDeepLinkBuilder> {
  @override
  bool onlyIfUninitialized = false;

  factory ClearDeepLinkBuilder() = _$ClearDeepLinkBuilder;
  ClearDeepLinkBuilder._();
}

///   ########  ####    ###    ########  ##    ##
///   ##     ##  ##    ## ##   ##     ##  ##  ##
///   ##     ##  ##   ##   ##  ##     ##   ####
///   ##     ##  ##  ##     ## ########     ##
///   ##     ##  ##  ######### ##   ##      ##
///   ##     ##  ##  ##     ## ##    ##     ##
///   ########  #### ##     ## ##     ##    ##

abstract class NavigateToDiary implements NavigationEvent, Built<NavigateToDiary, NavigateToDiaryBuilder> {
  @nullable
  DiaryDeepLink get deepLink;

  factory NavigateToDiary([void Function(NavigateToDiaryBuilder) updates]) = _$NavigateToDiary;
  NavigateToDiary._();
}

abstract class NavigateToDiaryBuilder implements NavigationEventBuilder, Builder<NavigateToDiary, NavigateToDiaryBuilder> {
  @override
  bool onlyIfUninitialized = false;

  @nullable
  DiaryDeepLink deepLink;

  factory NavigateToDiaryBuilder() = _$NavigateToDiaryBuilder;
  NavigateToDiaryBuilder._();
}

/// Diary-specific deep link
abstract class DiaryDeepLink implements DeepLink {}

/// Deep link to [date] under diary tab.
abstract class DateDeepLink implements DiaryDeepLink, Built<DateDeepLink, DateDeepLinkBuilder> {
  int get date;

  factory DateDeepLink([void Function(DateDeepLinkBuilder) updates]) = _$DateDeepLink;
  DateDeepLink._();
}

///   ######## ########     ###     ######  ##    ## #### ##    ##  ######
///      ##    ##     ##   ## ##   ##    ## ##   ##   ##  ###   ## ##    ##
///      ##    ##     ##  ##   ##  ##       ##  ##    ##  ####  ## ##
///      ##    ########  ##     ## ##       #####     ##  ## ## ## ##   ####
///      ##    ##   ##   ######### ##       ##  ##    ##  ##  #### ##    ##
///      ##    ##    ##  ##     ## ##    ## ##   ##   ##  ##   ### ##    ##
///      ##    ##     ## ##     ##  ######  ##    ## #### ##    ##  ######

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

///   ########  ######## ########   #######  ########  ########  ######
///   ##     ## ##       ##     ## ##     ## ##     ##    ##    ##    ##
///   ##     ## ##       ##     ## ##     ## ##     ##    ##    ##
///   ########  ######   ########  ##     ## ########     ##     ######
///   ##   ##   ##       ##        ##     ## ##   ##      ##          ##
///   ##    ##  ##       ##        ##     ## ##    ##     ##    ##    ##
///   ##     ## ######## ##         #######  ##     ##    ##     ######

/// Navigate to reports tab.
abstract class NavigateToReports implements NavigationEvent, Built<NavigateToReports, NavigateToReportsBuilder> {
  factory NavigateToReports([void Function(NavigateToReportsBuilder) updates]) = _$NavigateToReports;
  NavigateToReports._();
}

abstract class NavigateToReportsBuilder implements NavigationEventBuilder, Builder<NavigateToReports, NavigateToReportsBuilder> {
  @override
  bool onlyIfUninitialized = false;

  factory NavigateToReportsBuilder() = _$NavigateToReportsBuilder;
  NavigateToReportsBuilder._();
}

///    ######  ######## ######## ######## #### ##    ##  ######    ######
///   ##    ## ##          ##       ##     ##  ###   ## ##    ##  ##    ##
///   ##       ##          ##       ##     ##  ####  ## ##        ##
///    ######  ######      ##       ##     ##  ## ## ## ##   ####  ######
///         ## ##          ##       ##     ##  ##  #### ##    ##        ##
///   ##    ## ##          ##       ##     ##  ##   ### ##    ##  ##    ##
///    ######  ########    ##       ##    #### ##    ##  ######    ######

abstract class NavigateToSettings implements NavigationEvent, Built<NavigateToSettings, NavigateToSettingsBuilder> {
  @nullable
  SettingsDeepLink get deepLink;

  factory NavigateToSettings([void Function(NavigateToSettingsBuilder) updates]) = _$NavigateToSettings;
  NavigateToSettings._();
}

abstract class NavigateToSettingsBuilder implements NavigationEventBuilder, Builder<NavigateToSettings, NavigateToSettingsBuilder> {
  @override
  bool onlyIfUninitialized = false;

  @nullable
  SettingsDeepLink deepLink;

  factory NavigateToSettingsBuilder() = _$NavigateToSettingsBuilder;
  NavigateToSettingsBuilder._();
}

/// Settings-specific deep link
abstract class SettingsDeepLink implements DeepLink {}

/// Deep link to [profile] settings.
abstract class ProfileDeepLink implements SettingsDeepLink, Built<ProfileDeepLink, ProfileDeepLinkBuilder> {
  factory ProfileDeepLink([void Function(ProfileDeepLinkBuilder) updates]) = _$ProfileDeepLink;
  ProfileDeepLink._();
}


/// Deep link to [subscriptionType] settings.
//abstract class SubscriptionDeepLink implements SettingsDeepLink, Built<SubscriptionDeepLink, SubscriptionDeepLinkBuilder> {
//  @nullable
//  SubscriptionType get subscriptionType;
//
//  factory SubscriptionDeepLink([void Function(SubscriptionDeepLinkBuilder) updates]) = _$SubscriptionDeepLink;
//  SubscriptionDeepLink._();
//}

/// Deep link to [theme] settings.
abstract class ThemeDeepLink implements SettingsDeepLink, Built<ThemeDeepLink, ThemeDeepLinkBuilder> {
  factory ThemeDeepLink([void Function(ThemeDeepLinkBuilder) updates]) = _$ThemeDeepLink;
  ThemeDeepLink._();
}

/// Deep link to [diary] settings.
abstract class DiarySettingsDeepLink implements SettingsDeepLink, Built<DiarySettingsDeepLink, DiarySettingsDeepLinkBuilder> {
  factory DiarySettingsDeepLink([void Function(DiarySettingsDeepLinkBuilder) updates]) = _$DiarySettingsDeepLink;
  DiarySettingsDeepLink._();
}

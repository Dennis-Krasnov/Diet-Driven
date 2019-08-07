import 'package:built_value/built_value.dart';

part 'navigation_events.g.dart';

abstract class NavigationEvent {}

/// Subscribes to bloc state stream, navigates to default page.
abstract class InitNavigation implements NavigationEvent, Built<InitNavigation, InitNavigationBuilder> {
  factory InitNavigation([void Function(InitNavigationBuilder) updates]) = _$InitNavigation;
  InitNavigation._();
}

/// Base class for all deep links.
abstract class DeepLink {}

/// Remove deep link from navigation state.
abstract class ClearDeepLink implements NavigationEvent, Built<ClearDeepLink, ClearDeepLinkBuilder> {
  factory ClearDeepLink([void Function(ClearDeepLinkBuilder) updates]) = _$ClearDeepLink;
  ClearDeepLink._();
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

///   ##        #######   ######    ######   #### ##    ##  ######
///   ##       ##     ## ##    ##  ##    ##   ##  ###   ## ##    ##
///   ##       ##     ## ##        ##         ##  ####  ## ##
///   ##       ##     ## ##   #### ##   ####  ##  ## ## ## ##   ####
///   ##       ##     ## ##    ##  ##    ##   ##  ##  #### ##    ##
///   ##       ##     ## ##    ##  ##    ##   ##  ##   ### ##    ##
///   ########  #######   ######    ######   #### ##    ##  ######

abstract class NavigateToLogging implements NavigationEvent, Built<NavigateToLogging, NavigateToLoggingBuilder> {
  factory NavigateToLogging([void Function(NavigateToLoggingBuilder) updates]) = _$NavigateToLogging;
  NavigateToLogging._();
}

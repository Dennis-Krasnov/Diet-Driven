import 'package:dietdriven/domain/user_account.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final UserAccount user; // TODO: nullable
  final List<DeepLink> deepLinkHistory;

  NavigationState({this.user, this.deepLinkHistory});

  NavigationState.splash() : user = null, deepLinkHistory = [
    DeepLink.splash(SplashDeepLink()),
  ];

  NavigationState.unauthenticated() : user = null, deepLinkHistory = [
    DeepLink.landing(LandingDeepLink.base()),
  ];

  // TODO: nullable
  // returning null is also false!
  DeepLink mostRecentWhere(bool test(DeepLink dl)) {
    assert(deepLinkHistory.isNotEmpty);
    return deepLinkHistory.reversed.firstWhere((dl) => test(dl), orElse: () => null);
  }

  // DeepLink get currentDeepLink {
  //   assert(deepLinkHistory.isNotEmpty);
  //   return deepLinkHistory.last;
  // }

  NavigationState copyWith({
    UserAccount user,
    String error,
    List<DeepLink> deepLinkHistory,
  }) => NavigationState(
    user: user ?? this.user,
    deepLinkHistory: deepLinkHistory ?? this.deepLinkHistory,
  );

  @override
  List<Object> get props => [user, deepLinkHistory];

  @override
  bool get stringify => true;
}
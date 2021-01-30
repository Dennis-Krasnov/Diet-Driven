import 'package:dietdriven/navigation/deep_link/prelude.dart';
import 'package:equatable/equatable.dart';

/// ...
class DeepLink extends Equatable {
  final DeepLinkPage currentPage;
  final SplashDeepLink splashDeepLink;
  final LandingDeepLink landingDeepLink;
  final LoginDeepLink loginDeepLink;
  final FailureDeepLink failureDeepLink;
  final HomeDeepLink homeDeepLink;

  DeepLink({this.currentPage, this.splashDeepLink, this.landingDeepLink, this.loginDeepLink, this.failureDeepLink, this.homeDeepLink});

  DeepLink copyWith({
    DeepLinkPage currentPage,
    SplashDeepLink splashDeepLink,
    LandingDeepLink landingDeepLink,
    LoginDeepLink loginDeepLink,
    FailureDeepLink failureDeepLink,
    HomeDeepLink homeDeepLink,
  }) => DeepLink(
    currentPage: currentPage ?? this.currentPage,
    splashDeepLink: splashDeepLink ?? this.splashDeepLink,
    landingDeepLink: landingDeepLink ?? this.landingDeepLink,
    loginDeepLink: loginDeepLink ?? this.loginDeepLink,
    failureDeepLink: failureDeepLink ?? this.failureDeepLink,
    homeDeepLink: homeDeepLink ?? this.homeDeepLink,
  );

  @override
  List<Object> get props => [currentPage, landingDeepLink, loginDeepLink, homeDeepLink];

  @override
  bool get stringify => true;
}
import 'package:dietdriven/navigation/deep_link/prelude.dart';
import 'package:equatable/equatable.dart';

/// ...
class DeepLink extends Equatable {
  final DeepLinkPage currentPage; // TODO: not nullable
  final SplashDeepLink splashDeepLink;
  final LandingDeepLink landingDeepLink;
  final LoginDeepLink loginDeepLink;
  final FailureDeepLink failureDeepLink;
  final HomeDeepLink homeDeepLink;

  DeepLink({this.currentPage, this.splashDeepLink, this.landingDeepLink, this.loginDeepLink, this.failureDeepLink, this.homeDeepLink});

  DeepLink.deserialize(String base64) : this._deserialize(base64); // TODO

  DeepLink._deserialize(Object protobuf) : // TODO
    currentPage = DeepLinkPage.home,
    splashDeepLink = null,
    landingDeepLink = null,
    loginDeepLink = null,
    failureDeepLink = null,
    homeDeepLink = null;

  String serialize() {
    // TODO
    return "";
  }

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

  bool isValid() {
    switch (currentPage) {
      case DeepLinkPage.splash:
        return splashDeepLink?.isValid() ?? false;

      case DeepLinkPage.landing:
        return landingDeepLink?.isValid() ?? false;

      case DeepLinkPage.login:
        return loginDeepLink?.isValid() ?? false;

      case DeepLinkPage.failure:
        return failureDeepLink?.isValid() ?? false;

      case DeepLinkPage.home:
        return homeDeepLink?.isValid() ?? false;

      default:
        return false;
    }
  }

  @override
  List<Object> get props => [currentPage, landingDeepLink, loginDeepLink, homeDeepLink];

  @override
  bool get stringify => true;
}
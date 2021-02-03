import 'dart:convert';

import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:dietdriven/navigation/deep_link/prelude.dart';
import 'package:equatable/equatable.dart';

/// ...
class DeepLink extends Equatable {
  
  // Properties
  
  final String firebaseDynamicLink;
  final DeepLinkPage currentPage; // TODO: not nullable
  final SplashDeepLink splashDeepLink;
  final LandingDeepLink landingDeepLink;
  final LoginDeepLink loginDeepLink;
  final FailureDeepLink failureDeepLink;
  final HomeDeepLink homeDeepLink;

  // Constructors
  
  DeepLink.splash(SplashDeepLink splashDeepLink) :
    firebaseDynamicLink = "",
    currentPage = DeepLinkPage.splash,
    splashDeepLink = splashDeepLink,
    landingDeepLink = null,
    loginDeepLink = null,
    failureDeepLink = null,
    homeDeepLink = null;

  DeepLink.landing(LandingDeepLink landingDeepLink) :
    firebaseDynamicLink = "",
    currentPage = DeepLinkPage.landing,
    splashDeepLink = null,
    landingDeepLink = landingDeepLink,
    loginDeepLink = null,
    failureDeepLink = null,
    homeDeepLink = null;

  DeepLink.login(LoginDeepLink loginDeepLink) :
    firebaseDynamicLink = "",
    currentPage = DeepLinkPage.landing,
    splashDeepLink = null,
    landingDeepLink = null,
    loginDeepLink = loginDeepLink,
    failureDeepLink = null,
    homeDeepLink = null;

  DeepLink.failure(FailureDeepLink failureDeepLink) :
    firebaseDynamicLink = "",
    currentPage = DeepLinkPage.failure,
    splashDeepLink = null,
    landingDeepLink = null,
    loginDeepLink = null,
    failureDeepLink = failureDeepLink,
    homeDeepLink = null;

  DeepLink.home(HomeDeepLink homeDeepLink) :
    firebaseDynamicLink = "",
    currentPage = DeepLinkPage.home,
    splashDeepLink = null,
    landingDeepLink = null,
    loginDeepLink = null,
    failureDeepLink = null,
    homeDeepLink = homeDeepLink;

  // Deserialization
  
  DeepLink.deserialize(String base64) : this.deserializeProto(DietDrivenDeepLinkProto.fromBuffer(base64Url.decode(base64)));

  DeepLink.deserializeProto(DietDrivenDeepLinkProto proto) :
    firebaseDynamicLink = proto.firebaseDynamicLink,
    currentPage = _deserializeProtoCurrentDay(proto.whichCurrentPage()),
    splashDeepLink = proto.hasSplash() ? SplashDeepLink.deserializeProto(proto.splash) : null,
    landingDeepLink = proto.hasLanding() ? LandingDeepLink.deserializeProto(proto.landing) : null,
    loginDeepLink = proto.hasLogin() ? LoginDeepLink.deserializeProto(proto.login) : null,
    failureDeepLink = proto.hasFailure() ? FailureDeepLink.deserializeProto(proto.failure) : null,
    homeDeepLink = proto.hasHome() ? HomeDeepLink.deserializeProto(proto.home) : null;

  static DeepLinkPage _deserializeProtoCurrentDay(DietDrivenDeepLinkProto_CurrentPage currentPage) {
    switch (currentPage) {
      case DietDrivenDeepLinkProto_CurrentPage.splash:
        return DeepLinkPage.splash;
        
      case DietDrivenDeepLinkProto_CurrentPage.landing:
        return DeepLinkPage.landing;
        
      case DietDrivenDeepLinkProto_CurrentPage.login:
        return DeepLinkPage.login;
        
      case DietDrivenDeepLinkProto_CurrentPage.failure:
        return DeepLinkPage.failure;
        
      case DietDrivenDeepLinkProto_CurrentPage.home:
        return DeepLinkPage.home;
        
      case DietDrivenDeepLinkProto_CurrentPage.notSet:
        throw Exception("TODO");
        
      default:
        throw Exception("TODO");
    }
  }

  // Serialization

  String serialize({String firebaseDynamicLink}) {
    final proto = serializeProto(firebaseDynamicLink: firebaseDynamicLink);
    final bytes = proto.writeToBuffer();
    final base64 = base64Url.encode(bytes);
    return base64;
  }
  
  
  DietDrivenDeepLinkProto serializeProto({String firebaseDynamicLink}) {
    final protoDeepLink = DietDrivenDeepLinkProto()
      ..firebaseDynamicLink = firebaseDynamicLink ?? this.firebaseDynamicLink;
    
    switch (currentPage) {
      case DeepLinkPage.splash:
        protoDeepLink.splash = splashDeepLink.serializeProto();
        break;

      case DeepLinkPage.landing:
        protoDeepLink.landing = landingDeepLink.serializeProto();
        break;

      case DeepLinkPage.login:
        protoDeepLink.login = loginDeepLink.serializeProto();
        break;

      case DeepLinkPage.failure:
        protoDeepLink.failure = failureDeepLink.serializeProto();
        break;

      case DeepLinkPage.home:
        protoDeepLink.home = homeDeepLink.serializeProto();
        break;

      default:
        throw UnimplementedError("Couldn't serialize DeepLink: Unknown current page $currentPage");
    }
    
    return protoDeepLink;
  }
  
  // Validity

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
  
  // Equatable

  @override
  List<Object> get props => [firebaseDynamicLink, currentPage, landingDeepLink, loginDeepLink, homeDeepLink];

  @override
  bool get stringify => true;
}
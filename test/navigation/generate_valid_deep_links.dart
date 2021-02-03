import 'package:dietdriven/generated/deeplink.pb.dart';

Iterable<DietDrivenDeepLinkProto> generateAllValidProtoDeepLinks() sync* {
  yield (DietDrivenDeepLinkProto()..splash = SplashDeepLinkProto());

  yield (DietDrivenDeepLinkProto()..landing = LandingDeepLinkProto());
  yield (DietDrivenDeepLinkProto()..landing = (LandingDeepLinkProto()..submittedEmail = "hello@gmail.com"));

  yield (DietDrivenDeepLinkProto()..login = (LoginDeepLinkProto()
    ..email = "hello@gmail.com"
    ..signInLink = "https://page.link?stuff=2"
  ));

  yield (DietDrivenDeepLinkProto()..failure = (FailureDeepLinkProto()
    ..error = "complete catastrophe"
  ));

  for (final homeDeepLink in generateAllValidHomeDeepLinks()) {
    yield (DietDrivenDeepLinkProto()..home = homeDeepLink);
  }
}

Iterable<HomeDeepLinkProto> generateAllValidHomeDeepLinks() sync* {
  yield(HomeDeepLinkProto()..diary = (DiaryDeepLinkProto()
    ..userUuid = "CYbTF52tUZuc39wnyKgBmv8QL6Wx"
    ..date = 23
  ));

  yield(HomeDeepLinkProto()..diet = DietDeepLinkProto());

  for (final isOnProfile in [false, true]) {
    yield(HomeDeepLinkProto()..settings = (SettingsDeepLinkProto()
      ..isOnProfile = isOnProfile
    ));
  }
}
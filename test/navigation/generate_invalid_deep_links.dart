import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:dietdriven/navigation/prelude.dart';

Iterable<DietDrivenDeepLinkProto> generateAllInvalidProtoDeepLinks() sync* {
  // yield (DietDrivenDeepLinkProto()); // Exception: TODO

  yield (DietDrivenDeepLinkProto()..login = LoginDeepLinkProto());
  for (final email in ["", "not an email"]) {
    yield (DietDrivenDeepLinkProto()..login = (LoginDeepLinkProto()
      ..email = email
      ..signInLink = "https://page.link.com/lalala"
    ));
  }
  for (final signInLink in ["", "not a url"]) {
    yield (DietDrivenDeepLinkProto()..login = (LoginDeepLinkProto()
      ..email = "example@gamil.com"
      ..signInLink = signInLink
    ));
  }

  yield (DietDrivenDeepLinkProto()..failure = FailureDeepLinkProto());
  yield (DietDrivenDeepLinkProto()..failure = (FailureDeepLinkProto()..error = ""));

  for (final homeDeepLink in generateAllInvalidHomeDeepLinks()) {
    yield (DietDrivenDeepLinkProto()..home = homeDeepLink);
  }
}

Iterable<HomeDeepLinkProto> generateAllInvalidHomeDeepLinks() sync* {
  // yield(HomeDeepLinkProto()); // Exception: TODO

  yield(HomeDeepLinkProto()..diary = DiaryDeepLinkProto());
  for (final userId in ["", "not 28 chars"]) {
    yield(HomeDeepLinkProto()..diary = (DiaryDeepLinkProto()
      ..userUuid = userId
      ..date = 23
    ));
  }
  yield(HomeDeepLinkProto()..diary = (DiaryDeepLinkProto()
    ..userUuid = "CYbTF52tUZuc39wnyKgBmv8QL6Wx"
    ..date = -3
  ));

  // yield(HomeDeepLinkProto()..diet = DietDeepLinkProto());

  // yield(HomeDeepLinkProto()..settings = SettingsDeepLinkProto());
}
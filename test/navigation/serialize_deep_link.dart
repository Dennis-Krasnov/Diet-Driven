import 'dart:math';

import 'package:dietdriven/navigation/prelude.dart';
import 'package:test/test.dart';

void main() {
  test("Serialize and deserialize valid deep links", () {
    randomDeepLinks().where((dl) => dl.isValid()).take(100).forEach((deepLink) {
      final identity = DeepLink.deserialize(deepLink.serialize());
      expect(identity, deepLink);
    });
  });
}

Iterable<DeepLink> randomDeepLinks() sync* {
  while (true) {
    yield DeepLink(
      currentPage: (List.from(DeepLinkPage.values)..shuffle()).first,
      splashDeepLink: 10.chance() ? null : SplashDeepLink(),
      landingDeepLink: 10.chance() ? null : LandingDeepLink(),
      loginDeepLink: 10.chance() ? null : LoginDeepLink(
        email: (["", "dennis.krasnov%gmail.com", "dennis.krasnov@gmail.com"]..shuffle()).first,
        signInLink: (["", "https://notdietdriven.com/123", "https://dietdriven.com/123"]..shuffle()).first,
      ),
      failureDeepLink: 10.chance() ? null : FailureDeepLink(
        error: (["", "complete catastrophe"]..shuffle()).first,
      ),
      homeDeepLink: 10.chance() ? null : HomeDeepLink(
        currentPage: (List.from(HomeDeepLinkPage.values)..shuffle()).first,
        diaryDeepLink: 10.chance() ? null : DiaryDeepLink(
          userId: (["", "not 28 characters", "CYbTF52tUZuc39wnyKgBmv8QL6Wx"]..shuffle()).first,
          date: ([-1, 0, 1, 9999]..shuffle()).first,
        ),
        dietDeepLink: 10.chance() ? null : DietDeepLink(),
        settingsDeepLink: 10.chance() ? null : SettingsDeepLink(
          isOnProfile: 50.chance(),
        ),
      ),
    );
  }
}

extension Percentage on int {
  bool chance() {
    final decimal = this / 100;
    return Random().nextDouble() <= decimal;
  }
}
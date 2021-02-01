import 'package:dietdriven/navigation/prelude.dart';
import 'package:test/test.dart';

void main() {
  test("Visit splash page", () {
    final deepLink = DeepLink(
      currentPage: DeepLinkPage.splash,
      splashDeepLink: SplashDeepLink(),
    );

    expect(true, deepLink.isValid());
  });

  group("Visit landing page", () {
    test("Visit landing page", () {
      final deepLink = DeepLink(
        currentPage: DeepLinkPage.landing,
        landingDeepLink: LandingDeepLink(),
      );

      expect(true, deepLink.isValid());
    });

    test("Visit landing submitted page", () {
      final deepLink = DeepLink(
        currentPage: DeepLinkPage.landing,
        landingDeepLink: LandingDeepLink(
          submittedEmail: "dennis.krasnov@gmail.com"
        ),
      );

      expect(true, deepLink.isValid());
    });

    test("Fail on invalid submitted email", () {
      final deepLink = DeepLink(
        currentPage: DeepLinkPage.landing,
        landingDeepLink: LandingDeepLink(
          submittedEmail: "",
        ),
      );

      expect(false, deepLink.isValid());
    });
  });

  group("Visit login page", () {
    test("Visit login page", () {
      final deepLink = DeepLink(
        currentPage: DeepLinkPage.login,
        loginDeepLink: LoginDeepLink(
          email: "dennis.krasnov@gmail.com",
          signInLink: "https://dietdriven.com/123",
        ),
      );

      expect(true, deepLink.isValid());
    });

    test("Fail on invalid email", () {
      for (final email in ["", "dennis.krasnov%gmail.com"]) {
        final deepLink = DeepLink(
          currentPage: DeepLinkPage.login,
          loginDeepLink: LoginDeepLink(
            email: email,
            signInLink: "https://dietdriven.com/123",
          ),
        );

        expect(false, deepLink.isValid());
      }
    });

    test("Fail on invalid signInLink", () {
      for (final signInLink in ["", "https://notdietdriven.com/123"]) {
        final deepLink = DeepLink(
          currentPage: DeepLinkPage.login,
          loginDeepLink: LoginDeepLink(
            email: "dennis.krasnov@gmail.com",
            signInLink: signInLink,
          ),
        );

        expect(false, deepLink.isValid());
      }
    });
  });

  group("Visit failure page", () {
    test("Visit failure page", () {
      final deepLink = DeepLink(
        currentPage: DeepLinkPage.failure,
        failureDeepLink: FailureDeepLink(
          error: "complete catastrophe",
        ),
      );

      expect(true, deepLink.isValid());
    });

    test("Fail on invalid error", () {
      final deepLink = DeepLink(
        currentPage: DeepLinkPage.failure,
        failureDeepLink: FailureDeepLink(
          error: "",
        ),
      );

      expect(false, deepLink.isValid());
    });
  });

  group("Visit home page", () {
    group("Visit diary page", () {
      test("Visit diary page", () {
        final deepLink = DeepLink(
          currentPage: DeepLinkPage.home,
          homeDeepLink: HomeDeepLink(
            currentPage: HomeDeepLinkPage.diary,
            diaryDeepLink: DiaryDeepLink(
              userId: "CYbTF52tUZuc39wnyKgBmv8QL6Wx",
              date: 23,
            ),
          ),
        );

        expect(true, deepLink.isValid());
      });

      test("Fail on invalid userId", () {
        for (final userId in ["", "not 28 characters"]) {
          final deepLink = DeepLink(
            currentPage: DeepLinkPage.home,
            homeDeepLink: HomeDeepLink(
              currentPage: HomeDeepLinkPage.diary,
              diaryDeepLink: DiaryDeepLink(
                userId: userId,
                date: 23,
              ),
            ),
          );

          expect(false, deepLink.isValid());
        }
      });

      test("Fail on invalid date", () {
        final deepLink = DeepLink(
          currentPage: DeepLinkPage.home,
          homeDeepLink: HomeDeepLink(
            currentPage: HomeDeepLinkPage.diary,
            diaryDeepLink: DiaryDeepLink(
              userId: "CYbTF52tUZuc39wnyKgBmv8QL6Wx",
              date: -2,
            ),
          ),
        );

        expect(false, deepLink.isValid());
      });
    });

    group("Visit diet page", () {
      test("Visit diet page", () {
        final deepLink = DeepLink(
          currentPage: DeepLinkPage.home,
          homeDeepLink: HomeDeepLink(
            currentPage: HomeDeepLinkPage.diet,
            dietDeepLink: DietDeepLink(),
          ),
        );

        expect(true, deepLink.isValid());
      });
    });

    group("Visit settings page", () {
      test("Visit settings page", () {
        final deepLink = DeepLink(
          currentPage: DeepLinkPage.home,
          homeDeepLink: HomeDeepLink(
            currentPage: HomeDeepLinkPage.settings,
            settingsDeepLink: SettingsDeepLink(
              isOnProfile: false,
            )
          ),
        );

        expect(true, deepLink.isValid());
      });

      // TODO: group for sub pages
    });

    test("Fail on empty sub deep link", () {
      for (final page in HomeDeepLinkPage.values) {
        final deepLink = DeepLink(
          currentPage: DeepLinkPage.home,
          homeDeepLink: HomeDeepLink(currentPage: page),
        );

        expect(false, deepLink.isValid());
      }
    });
  });

  test("Fail on empty deep link", () {
    final deepLink = DeepLink();

    expect(false, deepLink.isValid());
  });

  test("Fail on empty sub deep link", () {
    for (final page in DeepLinkPage.values) {
      final deepLink = DeepLink(currentPage: page);

      expect(false, deepLink.isValid());
    }
  });
}
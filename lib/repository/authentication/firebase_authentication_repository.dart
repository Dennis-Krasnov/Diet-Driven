import 'package:dietdriven/domain/user_account.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Stream<UserAccount> authStateChanges() => auth.authStateChanges()
    // TODO: debounce to now jump around when null -> non-null quickly
    //  https://github.com/ReactiveX/rxdart/blob/master/lib/src/transformers/backpressure/debounce.dart
    .map((user) {
      print("FB USER IS $user");
      if (user == null) return null;

      return UserAccount(
        uid: user.uid,
        email: user.email,
        paidUser: false,
      );
    });
    // .map((user) => UserAccount(
    //   paidUser: false,
    // ));

  @override
  Future<String> sendSignInLinkToEmail(String email) async {
    try {
      await auth.sendSignInLinkToEmail(email: email, actionCodeSettings: ActionCodeSettings(
        // androidPackageName: "dev.krasnov.dietdriven",
        // androidMinimumVersion: "1.0.0",
        // iOSBundleId: "dev.krasnov.dietdriven",
        dynamicLinkDomain: "dietdriven.page.link",
        handleCodeInApp: true,
        url: "https://dietdriven.krasnov.dev/please_login_lol", // TODO: document that one has to create url prefix in dashboard, and add url allowlist regex, and add dietdriven.krasnov.dev to auth/sign-in-method/authorized domains
        // url: "dietdriven.krasnov.dev",
      ));

      return null;
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }

  // https://fitness-driven.firebaseapp.com/__/auth/action?apiKey=AIzaSyCjhyVG6E9_NHfd0JdrWwmbSnhXAkS3Ur8&mode=signIn&oobCode=S4VuICbMfzMva1Pd7WJpbogw3Ys5o7NSY8oGRlUCis0AAAF3W1Yd5w&continueUrl=https://dietdriven.krasnov.dev/please_login_lol&lang=en
  // https://fitness-driven.firebaseapp.com
    // /__/auth/action
    // ?apiKey=AIzaSyCjhyVG6E9_NHfd0JdrWwmbSnhXAkS3Ur8
    // &mode=signIn
    // &oobCode=S4VuICbMfzMva1Pd7WJpbogw3Ys5o7NSY8oGRlUCis0AAAF3W1Yd5w
    // &continueUrl=https://dietdriven.krasnov.dev/please_login_lol
    // &lang=en

  @override
  Future<String> signInWithEmailLink(String email, String emailLink) async {
    print("trying with $email ; $emailLink");
    try {
      await auth.signInWithEmailLink(email: email, emailLink: emailLink);
      return null;
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }

  @override
  Future<void> signOut() {
    return auth.signOut();
  }
}
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
        paidUser: false,
      );
    });
    // .map((user) => UserAccount(
    //   paidUser: false,
    // ));

  @override
  Future<void> sendSignInLinkToEmail(String email) {
    return auth.sendSignInLinkToEmail(email: email, actionCodeSettings: null); // TODO: dynamic link settings!
  }

  @override
  Future<void> signInWithEmailLink(String email, String emailLink) {
    return auth.signInWithEmailLink(email: email, emailLink: emailLink);
  }

  @override
  Future<void> signOut() {
    return auth.signOut();
  }
}
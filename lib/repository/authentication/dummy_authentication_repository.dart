import 'package:dietdriven/domain/user_account.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:time/time.dart';

class DummyAuthenticationRepository implements AuthenticationRepository {
  @override
  Stream<UserAccount> authStateChanges() async* {
    await 30.seconds.delay;
    yield null;
    await 5.seconds.delay;
    yield UserAccount(email: "dennis.krasnov@gmail.com");
    await 1.hours.delay;
  }

  @override
  Future<String> sendSignInLinkToEmail(String email) async {
    return null;
  }

  @override
  Future<String> signInWithEmailLink(String email, String emailLink) async {
    return null;
  }

  @override
  Future<void> signOut() async {
    return;
  }
}
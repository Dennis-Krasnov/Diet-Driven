import 'package:dietdriven/domain/user.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:time/time.dart';

class DummyAuthenticationRepository implements AuthenticationRepository {
  @override
  Stream<User> authStateChanges() async* {
    await 1.seconds.delay;
    yield null;
    await 5.seconds.delay;
    yield User();
    await 1.hours.delay;
  }

  @override
  Future<void> sendSignInLinkToEmail(String email) async {
    return;
  }

  @override
  Future<void> signInWithEmailLink(String email, String emailLink) async {
    return;
  }

  @override
  Future<void> signOut() async {
    return;
  }
}
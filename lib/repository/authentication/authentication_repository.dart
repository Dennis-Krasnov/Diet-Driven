import 'package:dietdriven/domain/user_account.dart';

/// Interface for user authentication and authorization.
abstract class AuthenticationRepository {
  /// Notifies about changes to the user's sign-in state (null for lack of user).
  Stream<UserAccount> authStateChanges();

  /// Sends a sign in with email link to provided email address.
  /// Returns exception message, if any.
  Future<String> sendSignInLinkToEmail(String email);

  /// Signs in using an email address and email sign-in link.
  /// Returns exception message, if any.
  Future<String> signInWithEmailLink(String email, String emailLink);

  /// Signs out the current user.
  Future<void> signOut();
}
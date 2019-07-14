import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/providers/providers.dart';
import 'package:diet_driven/models/models.dart';

/// Data access object for authentication and user data.
class UserRepository {
  final _firestoreProvider = FirestoreProvider();

  /// Streams [FirebaseUser] authentication status using `firebase_auth` library.
  ///
  /// Returns [null] if unauthenticated.
  Stream<FirebaseUser> get authStateChanged$ => FirebaseAuth.instance.onAuthStateChanged;

  /// Signs in anonymously using `firebase_auth` library.
  ///
  /// Returns authenticated [FirebaseUser].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<FirebaseUser> signInAnonymously() => FirebaseAuth.instance.signInAnonymously();

  /// Signs in with email and password using `firebase_auth` library.
  ///
  /// Returns authenticated [FirebaseUser].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<FirebaseUser> signInWithEmail({@required String email, @required String password}) {
    assert(email != null && email.isNotEmpty);
    assert(password != null && password.isNotEmpty);

    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  /// Creates email-password account using `firebase_auth` library.
  ///
  /// Returns authenticated [FirebaseUser].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<void> createAccountWithEmail({@required String email, @required String password}) {
    assert(email != null && email.isNotEmpty);
    assert(password != null && password.isNotEmpty);

    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }

  /// Signs out using `firebase_auth` library.
  Future<void> signOut() => FirebaseAuth.instance.signOut();


  /// Streams [userId]'s [UserDocument].
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<UserDocument> userDocument$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return _firestoreProvider.userDocument$(userId);
  }
}

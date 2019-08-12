import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/providers/firestore_paths.dart';
import 'package:diet_driven/providers/firestore_serializer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'package:diet_driven/models/models.dart';

/// Data access object for authentication and user data.
class UserRepository {
  /// Streams [Authentication] authentication status using `firebase_auth` library.
  ///
  /// Returns [null] if unauthenticated.
  Stream<Authentication> authStateChanged$() => FirebaseAuth.instance.onAuthStateChanged.map((user) => Authentication((b) => b
    ..uid = user.uid
    ..email = user.email
    ..displayName = user.displayName
    ..isAnonymous = user.isAnonymous
    ..isEmailVerified = user.isEmailVerified
  ));

  /// Signs in anonymously using `firebase_auth` library.
  ///
  /// Returns authenticated [FirebaseUser].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<AuthResult> signInAnonymously() => FirebaseAuth.instance.signInAnonymously();

  /// Signs in with email and password using `firebase_auth` library.
  ///
  /// Returns authenticated [AuthResult].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<AuthResult> signInWithEmail({@required String email, @required String password}) {
    assert(email != null && email.isNotEmpty);
    assert(password != null && password.isNotEmpty);

    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  /// Creates email-password account using `firebase_auth` library.
  ///
  /// Returns authenticated [AuthResult].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<AuthResult> createAccountWithEmail({@required String email, @required String password}) {
    assert(email != null && email.isNotEmpty);
    assert(password != null && password.isNotEmpty);

    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }

  /// Signs out using `firebase_auth` library.
  Future<void> signOut() => FirebaseAuth.instance.signOut();


  /// Streams [userId]'s [UserDocument] using `cloud_firestore` library.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<UserDocument> userDocument$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    final docRef = Firestore.instance.document(FirestorePaths.user(userId));
    return docRef.snapshots().transform(FirestoreSerializer<UserDocument>().deserializeDocumentTransform());
  }
}

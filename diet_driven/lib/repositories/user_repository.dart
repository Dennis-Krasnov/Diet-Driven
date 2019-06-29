import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/providers/providers.dart';
import 'package:diet_driven/models/models.dart';

/// Data access object for authentication and user data.
class UserRepository {
  final _firestoreProvider = FirestoreProvider();

  /// Fetches [Observable] of [FirebaseUser] authentication status.
  /// 'authStateChangedStream` is called from [UserDataBloc].
  ///
  /// Returns [null] if unauthenticated.
  /// Always returns an initial value upon subscribing.
  Observable<FirebaseUser> get authStateChangedStream => Observable(FirebaseAuth.instance.onAuthStateChanged);

  /// Signs in anonymously with Firebase Authentication.
  /// TODO: where called from
  ///
  /// Returns authenticated [FirebaseUser].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<FirebaseUser> signInAnonymously() => FirebaseAuth.instance.signInAnonymously();

  /// Signs in with email and password with Firebase Authentication.
  /// TODO: where called from
  ///
  /// Returns authenticated [FirebaseUser].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<FirebaseUser> signInWithEmail(String email, String password) =>
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

  /// Creates account with email and password with Firebase Authentication.
  /// TODO: where called from
  ///
  /// Returns authenticated [FirebaseUser].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<void> createAccountWithEmail(String email, String password) =>
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

  /// Signs out of Firebase Authentication session.
  /// TODO: where called from
  Future<void> signOut() => FirebaseAuth.instance.signOut();


  /// Fetches [Observable] of [userId]'s [UserDocument].
  /// 'userDocumentStream(userId)` is called for every user from [UserDataBloc].
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<UserDocument> userDocumentStream(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return _firestoreProvider.userDocument(userId);
  }

  ///
  /// Uses authenticated user's userId
  Future<void> subscribe(SubscriptionType subscriptionType) async {
    // TODO: use IAP library
//    assert(subscriptionType != null);
//
//    // TODO: move to provider
//    final HttpsCallable updateSubscription = CloudFunctions.instance.getHttpsCallable(
//        functionName: 'updateSubscription'
//    )..timeout = Duration(seconds: 10);
//
////   Cloud function parameters CANNOT be defined as <String, dynamic>{}
//    return updateSubscription({"subscriptionType": subscriptionType.toString()});
  }
}

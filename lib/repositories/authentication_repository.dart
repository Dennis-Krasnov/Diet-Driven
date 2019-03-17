import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  // FIREBASE AUTH PROVIDER IS REDUNDANT!!!
//  final FirebaseAuthProvider _firebaseAuthProvider = FirebaseAuthProvider();

  Stream<FirebaseUser> get authStream => FirebaseAuth.instance.onAuthStateChanged;

  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  Future<FirebaseUser> signInAnonymously() => FirebaseAuth.instance.signInAnonymously();

  Future<FirebaseUser> signInWithEmail(String email, String password) =>
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

  Future<void> createAccountWithEmail(String email, String password) =>
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

  Future<void> signOut() => FirebaseAuth.instance.signOut();
}
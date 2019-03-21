import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AuthenticationRepository {
  // FIREBASE AUTH PROVIDER IS REDUNDANT?
//  final FirebaseAuthProvider _firebaseAuthProvider = FirebaseAuthProvider();

  Stream<FirebaseUser> get authStream => FirebaseAuth.instance.onAuthStateChanged;

  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  Future<String> get currentUserId async {
    var user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  ValueObservable<FirebaseUser> get onAuthStateChangedStream => FirebaseAuth.instance.onAuthStateChanged;

  Future<bool> get isCurrentUserAnonymous async {
    var user = await FirebaseAuth.instance.currentUser();
    return user.isAnonymous;
  }

  Future<FirebaseUser> signInAnonymously() => FirebaseAuth.instance.signInAnonymously();

  Future<FirebaseUser> signInWithEmail(String email, String password) =>
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

  Future<void> createAccountWithEmail(String email, String password) =>
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

  Future<void> signOut() => FirebaseAuth.instance.signOut();
}

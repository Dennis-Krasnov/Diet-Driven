import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';

final StreamMatcher doesNotEmit = emitsInOrder([]);


// Mock repositories
class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

// Mock blocs
class MockAuthenticationBloc extends Mock implements AuthenticationBloc {}

// Mock Firestore
class FirebaseAuthMock extends Mock implements FirebaseAuth {}
class FirebaseUserMock extends Mock implements FirebaseUser {}
class GoogleSignInMock extends Mock implements GoogleSignIn {}
class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {}
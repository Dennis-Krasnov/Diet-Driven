import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser, FirebaseAuth;
import 'package:google_sign_in/google_sign_in.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';

final StreamMatcher doesNotEmit = emitsInOrder([]);

// Mock repositories
class MockDiaryRepository extends Mock implements DiaryRepository {}
class MockUserRepository extends Mock implements UserRepository {}
class MockFoodRepository extends Mock implements FoodRepository {}
class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

// Mock blocs
class MockUserDataBlock extends Mock implements UserDataBloc {}

// Mock Firestore
class FirebaseAuthMock extends Mock implements FirebaseAuth {}
class FirebaseUserMock extends Mock implements FirebaseUser {}
class GoogleSignInMock extends Mock implements GoogleSignIn {}
class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {}

// .then((_) {
  // Due to an unknown issue - emitsInOrder views consecutive identical built values (value-wise) as a single emission,
  // Instead of two identical entries in emitsInOrder, we must test that the final state is the same.
  // can transform to take distinct values only if needed to achieve a similar behaviour.
  // example: expect(configurationBloc.currentState, ConfigurationLoaded((b) => b..configuration = remoteConfig.toBuilder()));
// });

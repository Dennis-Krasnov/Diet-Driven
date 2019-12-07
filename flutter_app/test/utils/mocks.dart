/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';

/// Mock repositories
class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}
class MockConfigurationRepository extends Mock implements ConfigurationRepository {}
class MockDiaryRepository extends Mock implements DiaryRepository {}
class MockFoodRepository extends Mock implements FoodRepository {}
class MockUserRepository extends Mock implements UserRepository {}
class MockSettingsRepository extends Mock implements SettingsRepository {}

/// Mock blocs
/// TODO: class MockCounterBloc extends MockBloc<CounterEvent, int> implements CounterBloc {}
class MockUserDataBloc extends Mock implements UserDataBloc {}
class MockFoodDiaryBloc extends Mock implements FoodDiaryBloc {}

/// Mock Firestore
class MockCloudFunctions extends Mock implements CloudFunctions {}
class MockHttpCallable extends Mock implements HttpsCallable {}
class MockHttpsCallableResult extends Mock implements HttpsCallableResult {}

class MockFirestore extends Mock implements Firestore {}
class MockDocumentReference extends Mock implements DocumentReference {}
class MockCollectionReference extends Mock implements DocumentReference {}
//class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}
//class FirebaseAuthMock extends Mock implements FirebaseAuth {}
//class FirebaseUserMock extends Mock implements FirebaseUser {}
//class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {}
//class GoogleSignInMock extends Mock implements GoogleSignIn {}
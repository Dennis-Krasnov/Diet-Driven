import 'package:diet_driven/blocs/bloc_utils.dart';
//import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter_test/flutter_test.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
//import 'package:package_info/package_info.dart' show PackageInfo;

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';

final StreamMatcher doesNotEmit = emitsInOrder(<dynamic>[]);

///
Duration ticks(int ticksCount, {int tickDuration = 20}) => Duration(milliseconds: ticksCount * tickDuration);

/// Mock repositories
class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}
class MockConfigurationRepository extends Mock implements ConfigurationRepository {}
class MockDiaryRepository extends Mock implements DiaryRepository {}
class MockFoodRepository extends Mock implements FoodRepository {}
class MockUserRepository extends Mock implements UserRepository {}
class MockSettingsRepository extends Mock implements SettingsRepository {}

/// Mock blocs
class MockUserDataBlock extends Mock implements UserDataBloc {}

/// Mock Firestore
//class FirebaseAuthMock extends Mock implements FirebaseAuth {}
//class FirebaseUserMock extends Mock implements FirebaseUser {}
//class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {}
//class GoogleSignInMock extends Mock implements GoogleSignIn {}

/// Mock Configuration
//class MockPackageInfo extends Mock implements PackageInfo {}

// .then((_) {
  // Due to an unknown issue - emitsInOrder views consecutive identical built values (value-wise) as a single emission,
  // Instead of two identical entries in emitsInOrder, we must test that the final state is the same.
  // can transform to take distinct values only if needed to achieve a similar behaviour.
  // example: expect(configurationBloc.currentState, ConfigurationLoaded((b) => b..configuration = remoteConfig.toBuilder()));
// });


class BuiltErrorMatcher extends Matcher {
  // TODO: generalized builtError
  final String expectedError;

  BuiltErrorMatcher(this.expectedError);

  @override
  Description describe(Description description) => description.add("builtError with error '$expectedError'");

//  @override
//  Description describeMismatch(dynamic item, Description mismatchDescription,
//      Map matchState, bool verbose) {
//
//  }

  @override
  bool matches(dynamic item, Map matchState) => item is BuiltError && item.error.toString().endsWith(expectedError);

}

//class WordMatcher extends Matcher {
//  Word expected;
//  Word actual;
//  WordMatcher(this.expected);
//
//  @override
//  Description describe(Description description) {
//    return description.add("has expected word content = '${expected.content}'");
//  }
//
//  @override
//  Description describeMismatch(
//      dynamic item,
//      Description mismatchDescription,
//      Map<dynamic, dynamic> matchState,
//      bool verbose
//      ) {
//    return mismatchDescription.add("has actual emitted word content = '${matchState['actual'].content}'");
//  }
//
//  @override
//  bool matches(actual, Map matchState) {
//    this.actual = actual;
//    matchState['actual'] = actual is Word ? actual : Word('unknown');
//    return (actual as Word).content == expected.content;
//  }
//}


// Ensure completer didn't timeout ()
// must: expect(completer.isCompleted, true);
// can't: expect(completer.future, completes)

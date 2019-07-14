void main() {

}
//import 'package:flutter_test/flutter_test.dart';
//
//import 'package:diet_driven/blocs/blocs.dart';
//import 'package:diet_driven/repositories/repositories.dart';
//import 'package:mockito/mockito.dart';
//
//import '../test_utils.dart';
//
//void main() {
//  SettingsEditBloc settingsEditBloc;
//
//  /// Mocks
//  UserRepository userRepository;
//
//  /// Data
//  const String userId = "2da87e9305069f1d";
//
//  setUp(() {
//    userRepository = MockUserRepository();
//
//    settingsEditBloc = SettingsEditBloc(
//      userId: userId,
//      userRepository: userRepository
//    );
//  });
//
//  test("Initialize properly", () {
//    expect(settingsEditBloc.initialState, SettingsEditLoaded());
//  });
//
//  test("Update dark mode succeeds", () {
//    // Mock data
////    when(userRepository.updateDarkMode(userId, true)).thenThrow(Exception("ERROR"));
//
////    when(userRepository.updateDarkMode(userId, any)).thenAnswer((_) => Future.delayed(Duration(milliseconds: 10)));
//    when(userRepository.updateDarkMode(userId, any)).thenAnswer((_) => Future.value(null));
//    settingsEditBloc = SettingsEditBloc(
//        userId: userId,
//        userRepository: userRepository
//    );
//
////    when(userRepository.updateDarkMode(
////      argThat(startsWith("invalid")),
////      argThat(startsWith("invalid"))
////    )).thenThrow(Exception("ERROR"));
//
//    // State changes
//    expectLater(
//      settingsEditBloc.state,
//      emitsInOrder(<SettingsEditState>[
//        SettingsEditLoaded(),
//        SettingsEditLoading(),
//        SettingsEditLoaded(),
//        SettingsEditLoading(),
//        SettingsEditLoaded(),
//      ])
//    ).then((_) {
////      // Repository calls
//      verify(userRepository.updateDarkMode(userId, true)).called(2);
//      verify(userRepository.updateDarkMode(userId, false)).called(1);
////      verify(userRepository.updateDarkMode(userId, false)).called(1);
////      verifyInOrder<void>([
////        userRepository.updateDarkMode(userId, true),
////        userRepository.updateDarkMode(userId, false),
////        userRepository.updateDarkMode(userId, true),
////      ]);
//    });
//
////    verify(userRepository.updateDarkMode(userId, false)).called(1);
//
////    verify(userRepository.updateDarkMode(userId, true)).called(2);
////    verify(userRepository.updateDarkMode(userId, false)).called(1);
//
//    // Actions
//    settingsEditBloc.dispatch(UpdateDarkMode((b) => b
//      ..darkMode = true
////      ..completer = MockCompleter TODO
//    )); // TODO: check completers!
//    settingsEditBloc.dispatch(UpdateDarkMode((b) => b..darkMode = false));
////    settingsEditBloc.dispatch(UpdateDarkMode((b) => b..darkMode = true));
//
////    verify(userRepository.updateDarkMode(userId, false)).called(1);
//  });
//
//}
//
//
//
////argThat(startsWith("invalid")),
////argThat(startsWith("invalid"))
//

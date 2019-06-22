import 'package:diet_driven/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils.dart';

void main() {
  UserRepository userRepository;
  DiaryRepository diaryRepository;
  FoodRepository foodRepository;
//  AnalyticsRepository analyticsRepository;

  setUp(() {
    userRepository = MockUserRepository();
    foodRepository = MockFoodRepository();
    diaryRepository = MockDiaryRepository();
  });

  group("Splash page", () {
    testWidgets("Starts off on splash screen", (WidgetTester tester) async {
//      await tester.pumpWidget(App(
//        userRepository: userRepository,
//        diaryRepository: diaryRepository,
//        foodRepository: foodRepository,
//        analyticsRepository: AnalyticsRepository(),
//      ));

//      final messageFinder = find.text('M');
//      expect(find.text('T'), findsOneWidget);
//      expect(messageFinder, findsOneWidget);
    });
  });

  group("Login page", () {

  });

  group("Loading page", () {

  });

  group("Error page", () {

  });

  group("Application", () {

  });

  group("Re-authentication", () {

  });
}

//tester.pump()
//Triggers a rebuild of the Widget after a given duration.
//tester.pumpAndSettle()
//Repeatedly calls pump with the given duration until there are no longer any frames scheduled. This essentially waits for all animations to complete.

//findsNothing
//verifies that no Widgets are found
//findsWidgets
//verifies one or more Widgets are found
//findsNWidgets
//verifies a specific number of Widgets are found

// await tester.enterText(find.byType(TextField), 'hi');

//await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));
//// Build the Widget until the dismiss animation ends
//await tester.pumpAndSettle();
//// Ensure the item is no longer on screen
//expect(find.text('hi'), findsNothing);

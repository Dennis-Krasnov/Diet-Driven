import 'package:built_redux/built_redux.dart';
import 'package:collection/collection.dart';
import 'package:diet_driven/containers/bottom_nav.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:built_redux/built_redux_test_utils.dart';
import 'dart:math';

import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/reducers/reducers.dart';

void main() {
  Store<AppState, AppStateBuilder, Actions> store;
  Actions actions;

  setUp(() {
    actions = new Actions();
    store = new Store<AppState, AppStateBuilder, Actions>(
//      reducerBuilder.build(),
      getBaseReducer(),
      new AppState(),
      actions,
    );
  });

  tearDown(() {
    store.dispose();
  });

  group('Unit Tests', () {
    test('handles tab changing', () {
      store.actions.navigation.goTo(Page.goals);
      expect(store.state.navigation.activePage, Page.goals);

      store.actions.navigation.goTo(Page.diary);
      expect(store.state.navigation.activePage, Page.diary);

      // TODO: customization for starting page!
    });

//    test("can change show bottom navigation", () {
//      store.actions.setShowBottomNavigation(false);
//      expect(store.state.showBottomNavigation, false);
//
//      // Reset to default
//      store.actions.resetBottomNavigation();
//      expect(store.state.showBottomNavigation, true);
//    });

    test("can change bottom navigation order", () {
//      List<Page> original = List<Page>.from(store.state.bottomNavigation);
      List<Page> changed = [Page.goals, Page.settings, Page.track];
      List<Page> illegal = [Page.goals];
      List<Page> illegalDuplicate = [Page.diary, Page.diary];
      List<Page> illegalMax = Page.inApp.toList();

      store.actions.navigation.reorderBottomNavigation(changed);
      expect(store.state.navigation.bottomNavigation, changed);

      // Don't allow bottom navigation with less than 2 elements (requirement of BottomNavigation)
      store.actions.navigation.reorderBottomNavigation(illegal);
      expect(store.state.navigation.bottomNavigation, changed);
      
      // Don't allow more than 7 pages
      expect(illegalMax.length > 7, true);
      store.actions.navigation.reorderBottomNavigation(illegalMax);
      expect(store.state.navigation.bottomNavigation, changed);

      // Don't allow duplicates
      store.actions.navigation.reorderBottomNavigation(illegalDuplicate);
      expect(store.state.navigation.bottomNavigation, changed);

      // Reset to default
//      store.actions.resetBottomNavigation();
//      expect(store.state.bottomNavigation, original);
    });

    test("pages content is valid and unique", () {
      expect(Page.inApp.map((p) => PageFactory.toText(p)).length == Page.inApp.map((p) => PageFactory.toText(p)).toSet().length, true);
      expect(Page.inApp.map((p) => PageFactory.toText(p)).contains("ERROR"), false);

      expect(Page.inApp.map((p) => PageFactory.toIcon(p)).length == Page.inApp.map((p) => PageFactory.toIcon(p)).toSet().length, true);
      expect(Page.inApp.map((p) => PageFactory.toIcon(p).icon).contains(Icons.error_outline), false);

      expect(Page.inApp.map((p) => PageFactory.toPage(p).toStringDeep()).length == Page.inApp.map((p) => PageFactory.toPage(p).toStringDeep()).toSet().length, true);
      expect(Page.inApp.map((p) => PageFactory.toPage(p) is Icon).contains(true), false);
    });
  });

  group("Widget Tests", () {
    Widget nav;

    setUp(() {
      nav = new ReduxProvider(
          store: store,
          child: MaterialApp(
              home: Scaffold(
            bottomNavigationBar: BottomNav(),
          )));
    });

    testWidgets("bottom navigation is shown", (WidgetTester tester) async {
      await tester.pumpWidget(nav);

      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(store.state.navigation.bottomNavigation.length));
    });

    // TODO: test selected icon is correct order
    testWidgets("buttons are in correct order", (WidgetTester tester) async {
      await tester.pumpWidget(nav);

      Finder diary = find.text("Diary");
      expect(diary, findsOneWidget);

      var rng = new Random();
      for (int i = 0; i < 1; i++) {
        int size = rng.nextInt(6) + 2;

        List<Page> pages = Page.inApp.toList();
        shuffle(pages);
        pages = pages.sublist(0, size);

        print(pages);
        store.actions.navigation.reorderBottomNavigation(pages);
        tester.element(find.byType(BottomNav)).markNeedsBuild();
        await tester.pump();
        print("---");
        print(store.state.navigation.bottomNavigation);
//        print(find.byType(Text));
//        print(tester.elementList(find.byType(Text)).map((el) => el.widget).toList());

        tester.allWidgets.where((w) => w is Text).toList().asMap().forEach((i, value) {
//          print('index=$i, value=$value');
          print(value);
        });
//        List<Widget> widgets = tester.allWidgets.toList().where((w) => w is Text).toList();
//        print(widgets);
//        print(tester.widget(find.text(PageFactory.toText(pages[0]))).toStringDeep());

//        Finder diary = find.text(PageFactory.toText(pages[0])); //widgetWithText(BottomNavigationBarItem, PageFactory.toText(pages[0]));
//        expect(diary, findsOneWidget);
//        check for errors!

      }


//      store.state.bottomNavigation.forEach((page) {
//        expect(find.byIcon(PageFactory.toIcon(page).icon), findsOneWidget);
//      });

//      expect(find.byWidgetPredicate(
//            (Widget widget) => widget is Tooltip && widget.message == 'Back',
//        description: 'widget with tooltip "Back"', // TODO: use this to check proper is selected
//      ), findsOneWidget);

      // TODO
      // Buttons displayed in order
//      for (int i = 0; i < store.state.bottomNavigation.length; i++) {
//        expect(find.byType(Icon)., equals(PageFactory.toIcon(store.state.bottomNavigation[i])));
      // Testing by text is easier!
//      }
    });

    testWidgets("actions are dispatched", (WidgetTester tester) async {
      await tester.pumpWidget(nav);

      // First
      expectDispatched(actions.navigation.goTo, verfier: (action) {
        expect(action.payload, store.state.navigation.bottomNavigation.first);
      });
      await tester.tap(find.byType(Icon).first);

      // Last
      expectDispatched(actions.navigation.goTo, verfier: (action) {
        expect(action.payload, store.state.navigation.bottomNavigation.last);
      });
      await tester.tap(find.byType(Icon).last);
    });
  });
}

// TODO:
// change, check that it's changed
// reset, check that it's the default
// if found default icon/text (check with every page!)
// check proper icon is selected!!
// check over maximum (7)
// randomize random subsets of all pages (unique!!) (many times!!!!)
// settings used to be a bottom navigation page, then if removed, what will be selected??

// Unit tests
// Reducer functions are very easy to unit test since they are pure functions
// Middleware functions that call out to APIs can be tested using Mock implementations. This is done using the Mockito library.
// selector functions are also easy to test since they are pure.

// Widget Tests
// container Widgets can be tested to ensure they generate the correct ViewModel.
// presentation Widgets can be tested by passing in fake data and making assertions against the Widget rendered with that data.

// Integration Tests
// Run the app and drive it using flutter_driver flutter drive --target test_driver/todo_app.dart.
// Use the "Page Object Model" pattern to make the tests easier to read and maintain.



// Finds a RichText widget that a descendant (child/grand-child/etc) of a
// tab widget with text "Tab 1"
//find.descendant(of: find.text('Tab 1'), matching: find.byType(RichText));

// Finds a parent widget of type MyParentWidget.
//tester.element(find.byType(MyChildWidget)).ancestorWidgetOfExactType(MyParentWidget);
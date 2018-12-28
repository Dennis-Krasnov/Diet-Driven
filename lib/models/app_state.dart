library app_state;

import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/page.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() => new _$AppState._(
      count: 0,
      activePage: Page.diary,
//      bottomNavigation: ["diary", "track", "diet"],
      bottomNavigation: [Page.diary, Page.track, Page.diet, Page.cycle, Page.settings],
  );

  AppState._();

  int get count;
  Page get activePage;
  List<Page> get bottomNavigation;
}

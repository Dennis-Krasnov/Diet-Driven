library app_state;

import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/page.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() => new _$AppState._(
      activePage: Page.diary,
      defaultPage: Page.diary, // TODO: read from settings object
      bottomNavigation: [Page.diary, Page.track, Page.diet, Page.cycle, Page.settings],
      bottomNavigationPage: Page.diary,
  );

  AppState._();

  Page get activePage;
  Page get defaultPage;

  // Bottom navigation
  List<Page> get bottomNavigation;
  Page get bottomNavigationPage;
}

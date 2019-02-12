library navigation_state;

import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/page.dart';

part 'navigation_state.g.dart';

///
abstract class NavigationState implements Built<NavigationState, NavigationStateBuilder> {
  Page get activePage;
  Page get defaultPage;

  List<Page> get bottomNavigation;

  @nullable // since goTo is called on app init??? - check
  Page get bottomNavigationPage;

  NavigationState._();
  factory NavigationState([updates(NavigationStateBuilder b)]) = _$NavigationState;
}

abstract class NavigationStateBuilder implements Builder<NavigationState, NavigationStateBuilder> {
  Page activePage = Page.track;
  Page defaultPage = Page.track;

  List<Page> bottomNavigation = [Page.diary, Page.track, Page.diet, Page.goals, Page.settings];

  @nullable
  Page bottomNavigationPage;

  factory NavigationStateBuilder() = _$NavigationStateBuilder;
  NavigationStateBuilder._();
}
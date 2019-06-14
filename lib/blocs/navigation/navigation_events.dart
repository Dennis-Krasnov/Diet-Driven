import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'navigation_events.g.dart';

abstract class NavigationEvent {
  Page get page;
}

/// Navigates to default [page] in bottom navigation if bloc hasn't been initialized.
abstract class InitialNavigateToPage with NavigationEvent implements Built<InitialNavigateToPage, InitialNavigateToPageBuilder> {
  InitialNavigateToPage._();
  factory InitialNavigateToPage([void Function(InitialNavigateToPageBuilder b)]) = _$InitialNavigateToPage;
}

/// Navigates to [page] in bottom navigation.
abstract class NavigateToPage with NavigationEvent implements Built<NavigateToPage, NavigateToPageBuilder> {
  NavigateToPage._();
  factory NavigateToPage([void Function(NavigateToPageBuilder b)]) = _$NavigateToPage;
}

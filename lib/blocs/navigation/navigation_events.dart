import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'navigation_events.g.dart';

abstract class NavigationEvent {}

abstract class NavigateToPage with NavigationEvent implements Built<NavigateToPage, NavigateToPageBuilder> {
  String get page;

  NavigateToPage._();
  factory NavigateToPage([updates(NavigateToPageBuilder b)]) = _$NavigateToPage;
}

abstract class ReorderNavigation with NavigationEvent implements Built<ReorderNavigation, ReorderNavigationBuilder> {
  BuiltList<String> get bottomNavigationPages;

  ReorderNavigation._();
  factory ReorderNavigation([updates(ReorderNavigationBuilder b)]) = _$ReorderNavigation;
}
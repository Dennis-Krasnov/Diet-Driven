import 'package:built_value/built_value.dart';

part 'navigation_events.g.dart';

abstract class NavigationEvent {}

abstract class NavigateToPage with NavigationEvent implements Built<NavigateToPage, NavigateToPageBuilder> {
  String get page;

  NavigateToPage._();
  factory NavigateToPage([updates(NavigateToPageBuilder b)]) = _$NavigateToPage;
}

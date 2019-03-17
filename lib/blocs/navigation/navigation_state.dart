import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'navigation_state.g.dart';

// no need for abstract mixin if only single state...

abstract class NavigationState implements Built<NavigationState, NavigationStateBuilder> {
  // FIXME: use page enum
  BuiltList<String> get bottomNavigationPages;
  String get currentPage;
  // TODO: default page here or in settings...

  NavigationState._();
  factory NavigationState([updates(NavigationStateBuilder b)]) = _$NavigationState;
}
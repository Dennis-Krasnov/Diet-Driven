import 'package:built_value/built_value.dart';

part 'navigation_state.g.dart';

abstract class NavigationState {}

abstract class NavigationUninitialized with NavigationState implements Built<NavigationUninitialized, NavigationUninitializedBuilder> {
  NavigationUninitialized._();
  factory NavigationUninitialized([updates(NavigationUninitializedBuilder b)]) = _$NavigationUninitialized;

  @override String toString() => runtimeType.toString();
}

abstract class NavigationLoaded with NavigationState implements Built<NavigationLoaded, NavigationLoadedBuilder> {
  // FIXME: use page enum
  String get currentPage;

  NavigationLoaded._();
  factory NavigationLoaded([updates(NavigationLoadedBuilder b)]) = _$NavigationLoaded;
}

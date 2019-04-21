import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'navigation_state.g.dart';

abstract class NavigationState {}

/// White screen with skeleton menu and app bar
abstract class NavigationUninitialized with NavigationState implements Built<NavigationUninitialized, NavigationUninitializedBuilder> {
  NavigationUninitialized._();
  factory NavigationUninitialized([updates(NavigationUninitializedBuilder b)]) = _$NavigationUninitialized;

  @override String toString() => runtimeType.toString();
}

/// Stores current bottom navigation [Page].
abstract class NavigationLoaded with NavigationState implements Built<NavigationLoaded, NavigationLoadedBuilder> {
  Page get currentPage;

  NavigationLoaded._();
  factory NavigationLoaded([updates(NavigationLoadedBuilder b)]) = _$NavigationLoaded;
}

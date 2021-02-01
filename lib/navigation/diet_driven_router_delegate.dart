import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/widget/diet_driven_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ...
class DietDrivenRouterDelegate extends RouterDelegate<DeepLink> with ChangeNotifier {
  final NavigationCubit navigationCubit;

  DietDrivenRouterDelegate({this.navigationCubit});

  /// for web ...
  @override
  Future<void> setInitialRoutePath(DeepLink configuration) async {
    print("DietDrivenRouterDelegate - setInitialRoutePath - $configuration");
    navigationCubit.replace(configuration);
  }

  /// for web ...
  @override
  Future<void> setNewRoutePath(DeepLink configuration) async {
    print("DietDrivenRouterDelegate - setNewRoutePath - $configuration");
    navigationCubit.push(configuration);
  }

  /// for web ...
  @override
  Future<bool> popRoute() async {
    print("DietDrivenRouterDelegate - popRoute");
    return navigationCubit.pop();
  }

  /// for web ...
  @override
  DeepLink get currentConfiguration {
    print("DietDrivenRouterDelegate - get currentConfiguration");
    // ...
    return navigationCubit.state.currentDeepLink;
  }

  @override
  Widget build(BuildContext context) {
    return DietDrivenNavigation();
  }
}




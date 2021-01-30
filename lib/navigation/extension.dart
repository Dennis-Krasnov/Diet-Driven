import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

extension NavigateContext on BuildContext {
  /// Wrapper for navigation with [Router] reporting route information back to web engine.
  /// Delegates navigation logic to [NavigationCubit].
  /// [RouterDelegate] is built based on the state of the navigation cubit.
  void navigate() {
    final navigationCubit = this.read<NavigationCubit>();
    Router.navigate(this, () {
      // TODO: take function as argument: (navigationCubit) => navigationCubit.goSomewhere();
      // navigationCubit.
    });
  }

  /// Wrapper for navigation without [Router] reporting route information back to web engine.
  /// Delegates navigation logic to [NavigationCubit].
  /// [RouterDelegate] is built based on the state of the navigation cubit.
  void neglect() {
    final navigationCubit = this.read<NavigationCubit>();
    Router.neglect(this, () {

    });
  }
}
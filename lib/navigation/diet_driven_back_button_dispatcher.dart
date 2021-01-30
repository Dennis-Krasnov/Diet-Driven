import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:flutter/material.dart';

class DietDrivenBackButtonDispatcher extends RootBackButtonDispatcher {
  final NavigationCubit navigationCubit;

  DietDrivenBackButtonDispatcher({this.navigationCubit});

  @override
  Future<bool> didPopRoute() async {
    print("DietDrivenBackButtonDispatcher - didPopRoute");
    return navigationCubit.pop();
  }
}
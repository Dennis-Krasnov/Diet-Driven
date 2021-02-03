import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// Handles platform pop route notifications.
/// FIXME: I think this is just supposed to delegate to a (specific) router delegate
class DietDrivenBackButtonDispatcher extends RootBackButtonDispatcher {
  final NavigationCubit navigationCubit;

  DietDrivenBackButtonDispatcher({this.navigationCubit});

  static final Logger _log = Logger(printer: PrettyPrinter(printTime: true));

  @override
  Future<bool> didPopRoute() async {
    _log.i("DietDrivenBackButtonDispatcher - didPopRoute");
    // TODO: return navigationCubit.routerDelegate.popRoute();
    return navigationCubit.pop();
  }
}
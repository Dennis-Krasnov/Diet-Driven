import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:diet_driven/blocs/theme/theme.dart';

/// Manages app-wide [ThemeData].
class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => ThemeData.light();

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    // TODO: use built value pattern
    // TODO: persist theme settings (use implicit overwriting similar to settings)
    switch (event) {
      // Switches to and from dark theme
      case ThemeEvent.toggleDarkTheme:
        yield currentState == ThemeData.dark()
          ? ThemeData.light()
          : ThemeData.dark();
        break;
    }
  }
}

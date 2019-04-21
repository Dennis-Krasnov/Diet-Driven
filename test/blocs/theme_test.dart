import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:diet_driven/blocs/blocs.dart';

void main() {
  ThemeBloc themeBloc;

  setUp(() {
    themeBloc = ThemeBloc();
  });

  test("Initialize properly", () {
    expect(themeBloc.initialState, ThemeData.light());
  });

  test("Switch between dark and light theme", () {
    expectLater(
      themeBloc.state,
      emitsInOrder([
        ThemeData.light(),
        ThemeData.dark(),
        ThemeData.light(),
        ThemeData.dark(),
      ])
    );

    themeBloc.dispatch(ThemeEvent.toggleDarkTheme);
    themeBloc.dispatch(ThemeEvent.toggleDarkTheme);
    themeBloc.dispatch(ThemeEvent.toggleDarkTheme);
  });
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/settings_edit/settings_edit.dart';
import 'package:diet_driven/log_printer.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

class SettingsEditBloc extends Bloc<SettingsEditEvent, SettingsEditState> {
  final logger = getLogger("settings edit bloc");
  final String userId;
  final SettingsRepository settingsRepository;

  SettingsEditBloc({@required this.userId, @required this.settingsRepository})
      : assert(userId != null), assert(settingsRepository != null);

  @override
  SettingsEditState get initialState => SettingsEditState();

  @override
  Stream<SettingsEditState> mapEventToState(SettingsEditEvent event) async* {
    if (event is UpdateDarkMode) {
      try {
        await settingsRepository.updateDarkMode(userId, event.darkMode);
        event.completer?.complete();
        logger.i("dark mode now ${event.darkMode}");
      } on Exception catch(e) {
        event.completer?.completeError(e);
      }
    }

//    if (event is UpdateDarkMode && currentState.updateDarkModeState != "loading") {
//      try {
//        yield SettingsEditState((b) => b..updateDarkModeState = "loading");
//        await Future<void>.delayed(Duration(seconds: 3));
//        await userRepository.updateDarkMode(userId, event.darkMode);
//        event.completer?.complete();
//        yield SettingsEditState((b) => b..updateDarkModeState = "loaded");
//        logger.i("updated dark mode");
//      } on Exception catch(e) {
//        event.completer?.completeError(e);
//        yield SettingsEditState((b) => b..updateDarkModeState = "failed");
//      } finally {
//        // FIXME: decide on whether to use completers (works individually) or error state (global load)
//        yield SettingsEditState();
//      }
//    }
  }
}




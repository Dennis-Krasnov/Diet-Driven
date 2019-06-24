import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/settings_edit/settings_edit.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class SettingsEditBloc extends Bloc<SettingsEditEvent, SettingsEditState> {
  final Logger _log = Logger("settings edit bloc");
  final String userId;
  final UserRepository userRepository;

  SettingsEditBloc({@required this.userId, this.userRepository}) : assert(userId != null);

  @override
  SettingsEditState get initialState => SettingsEditState(); // TODO: cycle between 'ready' and 'loading', store big form fields

  @override
  Stream<SettingsEditState> mapEventToState(SettingsEditEvent event) async* {
    if (event is UpdateDarkMode) {
      try {
        await userRepository.updateDarkMode(userId, event.darkMode);
        event.completer?.complete();
        _log.info("updated dark mode");
      } on Exception catch(e) {
        event.completer?.completeError(e);
      }
    }
  }
}



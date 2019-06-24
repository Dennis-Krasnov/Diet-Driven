import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:diet_driven/blocs/settings_search/settings_search.dart';

class SettingsSearchBloc extends Bloc<SettingsSearchEvent, SettingsSearchState> {
  @override
  SettingsSearchState get initialState => null;

  @override
  Stream<SettingsSearchState> mapEventToState(SettingsSearchEvent event) async* {

  }
}


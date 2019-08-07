import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/widgets/core/core.dart';
import 'package:diet_driven/widgets/loading/loading.dart';
import 'package:diet_driven/widgets/message/message.dart';
import 'package:diet_driven/widgets/onboarding/login.dart';

/// Reactively builds app based on [userDataState] and [configurationState].
class ConfigurationSettingsDecision extends StatelessWidget {
  final ConfigurationState configurationState;
  final UserDataState userDataState;

  const ConfigurationSettingsDecision({Key key, @required this.configurationState, @required this.userDataState})
    : assert(configurationState != null), assert(userDataState != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initial splash screen while loading critical configuration and user data
    if (configurationState is ConfigurationUninitialized || userDataState is UserDataUninitialized) {
      return SplashPage();
    }

    // Loading configuration failed
    if (configurationState is ConfigurationFailed) {
      return ErrorPage(
        error: (configurationState as ConfigurationFailed).error.toString(),
        trace: (configurationState as ConfigurationFailed).stacktrace.toString()
      );
    }

    // Configuration is loaded from now on
    assert(configurationState is ConfigurationLoaded);

    // Loading user data failed
    if (userDataState is UserDataFailed) {
      return ErrorPage(
        error: (userDataState as UserDataFailed).error.toString(),
        trace: (userDataState as UserDataFailed).stacktrace.toString()
      );
    }

    // Onboarding / sign in / sign up
    if (userDataState is UserDataUnauthenticated) {
      return LoginPage();
    }

    // Start application when user is loaded
    if (userDataState is UserDataLoaded) {
      // Inject user-specific blocs into application
      return MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(
            builder: (BuildContext context) => NavigationBloc(
              analyticsRepository: RepositoryProvider.of<AnalyticsRepository>(context),
              userDataBloc: BlocProvider.of<UserDataBloc>(context)
            )..dispatch(InitNavigation()),
          ),
          BlocProvider<FoodDiaryBloc>(
            builder: (BuildContext context) => FoodDiaryBloc(
              diaryRepository: RepositoryProvider.of<DiaryRepository>(context),
              userId: (userDataState as UserDataLoaded).authentication.uid,
            )..dispatch(InitFoodDiary()),
          ),
          // TODO: tracking bloc
        ],
        child: TabbedNavigation(),
      );
    }

    return ErrorPage(error: "Invalid user data state: $userDataState}");
  }
}

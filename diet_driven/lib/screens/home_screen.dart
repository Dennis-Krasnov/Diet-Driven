import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/screens/error_screen.dart';
import 'package:diet_driven/screens/login.dart';
import 'package:diet_driven/screens/splash_screen.dart';
import 'package:diet_driven/screens/tabbed_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

/// Reactively builds app based on [userDataState] and [configurationState].
class HomePage extends StatelessWidget {
  final ConfigurationState configurationState;
  final UserDataState userDataState;

  const HomePage({Key key, @required this.configurationState, @required this.userDataState})
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
        trace: (userDataState as UserDataFailed).trace.toString()
      );
    }

    // Onboarding / sign in / sign up
    if (userDataState is UserDataUnauthenticated) {
      return LoginPage();
    }

    // Start application when user is loaded
    if (userDataState is UserDataLoaded) {
      // OPTIMIZE: AnimatedCrossFade from splash to home page
      return MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(
            builder: (BuildContext context) => NavigationBloc(
              analyticsRepository: RepositoryProvider.of<AnalyticsRepository>(context),
              userDataBloc: BlocProvider.of<UserDataBloc>(context)
            ),
          ),
//        BlocProvider<FoodDiaryBloc>(
//          builder: (BuildContext context) => FoodDiaryBloc(
//            diaryRepository: Repository().diary,
//            userId: (BlocProvider.of<UserDataBloc>(context).currentState as UserDataLoaded).authentication.uid,
//            daysSinceEpoch: 124
//          ),
//          dispose: (BuildContext context, FoodDiaryBloc tempFoodDiaryBloc) => tempFoodDiaryBloc.dispose(),
//        ),
        ],
        // TODO: tracking...
        child: TabbedNavigation(),
      );
    }

    return ErrorPage(error: "Invalid user data state: $userDataState}");
  }
}

import 'package:diet_driven/screens/tabbed_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/blocs/blocs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<NavigationBloc>(
          builder: (BuildContext context) => NavigationBloc(analyticsRepository: Repository().analytics, userDataBloc: BlocProvider.of<UserDataBloc>(context)),
          dispose: (BuildContext context, NavigationBloc navigationBloc) => navigationBloc.dispose(),
        ),
        // Blocs that fetch their own data must be instantiated above navigation BlocBuilder
        // Otherwise they're recreated every time the user switches tabs
        BlocProvider<FoodDiaryBloc>(
          builder: (BuildContext context) => FoodDiaryBloc(diaryRepository: Repository().diary, userId: "Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", daysSinceEpoch: 124),
          dispose: (BuildContext context, FoodDiaryBloc tempFoodDiaryBloc) => tempFoodDiaryBloc.dispose(),
        ),
      ],
      child: TabbedNavigation(),
    );
  }
}

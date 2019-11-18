/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:bloc_logging/bloc_logging.dart';
import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:diet_driven/navigation/navigation.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';

/// Shows diary page scaffold and diary day page switcher.
class FoodDiaryPage extends StatefulWidget {
  final int initialDate;

  const FoodDiaryPage({Key key, this.initialDate}) : super(key: key);

  @override
  _FoodDiaryPageState createState() => _FoodDiaryPageState();
}

class _FoodDiaryPageState extends State<FoodDiaryPage> {
  /// Must be stateful widget to persist page controller state throughout builds.
  /// Initializes default PageView day as today.
  PageController _controller;

  @override
  void initState() {
    super.initState();
//    _controller = PageController(initialPage: BlocProvider.of<FoodDiaryBloc>(context)?.date ?? currentDaysSinceEpoch());
    _controller = PageController(initialPage: widget.initialDate);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar field requires a PreferredSizeWidget
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<FoodDiaryBloc, FoodDiaryState>(
          // Rebuild only if state changed
          condition: (previous, current) => previous is! FoodDiaryLoaded || current is! FoodDiaryLoaded,
          builder: (BuildContext context, FoodDiaryState foodDiaryState) {
            BlocLogger().ui("Food diary app bar rebuild");

            // Skeleton diary app bar
            if (foodDiaryState is FoodDiaryUninitialized) {
              return AppBar(title: const Text("loading..."));
//              return const SplashPage(); // FIXME: different splash page for diary, without bottom navigation
            }

            // Loading food diary days failed
            if (foodDiaryState is FoodDiaryFailed) {
              // OPTIMIZE: food diary day blocs inherit diary bloc's error state!
              return Container();
//              return ErrorPage(
//                error: foodDiaryState.error.toString(),
//                trace: foodDiaryState.stacktrace.toString()
//              );
            }

            // Food diary is loaded from now on
            assert(foodDiaryState is FoodDiaryLoaded);

            final loadedState = foodDiaryState as FoodDiaryLoaded;

            return PageControllerDate(
              pageController: _controller,
              // TODO: experiment with no elevation on this app bar in particular (when headers same colour as page)
              builder: (BuildContext context, int currentDate) => AppBar(
                title: Text(
                  "Diary",
                  style: Theme.of(context).textTheme.title,
                ),
                actions: <Widget>[
                  if (currentDate == currentDaysSinceEpoch())
                    const CircleAvatar(backgroundColor: Colors.red),
                  if (currentDate - currentDaysSinceEpoch() < -30)
                    const CircleAvatar(),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    // Doesn't build / fetch data for intermediate pages (but no animation, whatever)
                    onPressed: () => DeepLinkNavigator.of(context).navigateTo([DiaryDateDL.today()]),
//                    onPressed: () => _controller.animateToPage(currentDaysSinceEpoch(), duration: Duration(milliseconds: 100), curve: Curves.ease),
                  ),
                  Text(
                    currentDate.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
                elevation: 0,
              ),
            );
          }
        ),
      ),
      body: PageView.builder(
        controller: _controller,
        itemBuilder: (BuildContext context, int page) {
          // Food diary day is agnostic to how food diary bloc data is sourced
          final foodDiaryDayProvider = BlocProvider<FoodDiaryDayBloc>(
            key: ValueKey(page), // TODO: OPTIMIZE: is this necessary? // TODOCUMENT
            builder: (BuildContext context) => FoodDiaryDayBloc(
              date: page,
              foodDiaryBloc: BlocProvider.of<FoodDiaryBloc>(context),
              diaryRepository: RepositoryProvider.of<DiaryRepository>(context),
            )..dispatch(InitFoodDiaryDay()),
            child: FoodDiaryDayPage(),
          );

          // TODO: rename to daysBehind?
          final daysAheadOfToday = page - currentDaysSinceEpoch();

          // Ongoing subscription starts a month ago from today
          if (daysAheadOfToday >= -30) {
            return foodDiaryDayProvider;
          }
          // Historical food diary bloc
          else {
            return BlocProvider<FoodDiaryBloc>(
              builder: (BuildContext context) => FoodDiaryBloc(
                diaryRepository: RepositoryProvider.of<DiaryRepository>(context),
                userId: BlocProvider.of<UserDataBloc>(context).userId,
                date: page,
              )..dispatch(InitFoodDiary()),
              child: foodDiaryDayProvider,
            );
          }
        },
      )
    );
  }
}

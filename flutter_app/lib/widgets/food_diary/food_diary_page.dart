/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:diet_driven/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/loading/loading.dart';
import 'package:diet_driven/widgets/message/message.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';

/// Shows diary page scaffold and diary day page switcher.
class FoodDiaryPage extends StatefulWidget {
  @override
  _FoodDiaryPageState createState() => _FoodDiaryPageState();
}

class _FoodDiaryPageState extends State<FoodDiaryPage> {
  /// Must be stateful widget to persist page controller state throughout builds.
  /// Initializes default PageView day as today.
  final controller = PageController(initialPage: currentDaysSinceEpoch());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar field requires a PreferredSizeWidget
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<FoodDiaryBloc, FoodDiaryState>(
          // Rebuild only if state changed
          condition: (previous, current) => previous is! FoodDiaryLoaded || current is! FoodDiaryLoaded,
          builder: (BuildContext context, FoodDiaryState foodDiaryState) {
            LoggingBloc().verbose("Food diary app bar rebuild");

            // Skeleton diary app bar
            if (foodDiaryState is FoodDiaryUninitialized) {
              return AppBar(title: const Text("loading..."),);
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
              pageController: controller,
              // TODO: experiment with no elevation on this app bar in particular (when headers same colour as page)
              builder: (BuildContext context, int currentDate) => AppBar(
                title: Text(
                  "Diary",
                  style: Theme.of(context).textTheme.title,
                ),
                actions: <Widget>[
                  if (currentDate == currentDaysSinceEpoch())
                    const CircleAvatar(backgroundColor: Colors.red,),
                  if (currentDate - currentDaysSinceEpoch() < -30)
                    const CircleAvatar(),
                  Text(
                    currentDate.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          }
        ),
      ),
      body: PageView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int page) {
          // Food diary day is agnostic to how food diary bloc data is sourced
          final foodDiaryDayProvider = BlocProvider<FoodDiaryDayBloc>(
            key: ValueKey(page), // OPTIMIZE: is this necessary? // TODOCUMENT
            builder: (BuildContext context) => FoodDiaryDayBloc(
              date: page,
              foodDiaryBloc: BlocProvider.of<FoodDiaryBloc>(context),
              diaryRepository: RepositoryProvider.of<DiaryRepository>(context),
            )..dispatch(InitFoodDiaryDay()),
            child: FoodDiaryDayPage(),
          );

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
        }
      )
    );

    // OPTIMIZE: PUT ONLY AROUND APP BAR??? - WON'T REBUILD EVERY SUB BLOC AND EVERYTHING!!
//    return BlocBuilder<FoodDiaryBloc, FoodDiaryState>(
//      condition: (previous, current) {
//        // Unconditional rebuild
//        if (previous is! FoodDiaryLoaded || current is! FoodDiaryLoaded)
//          return true;
//
//        // Rebuild only if current date changed
//        return (previous as FoodDiaryLoaded).currentDate != (current as FoodDiaryLoaded).currentDate;
//      },
//      builder: (BuildContext context, FoodDiaryState foodDiaryState) {
//        LoggingBloc().verbose("Food diary rebuild");
//
//        // White screen with skeleton diary app bar and food records
//        if (foodDiaryState is FoodDiaryUninitialized) {
//          return const SplashPage(); // FIXME: different splash page for diary, without bottom navigation
//        }
//
//        // Loading food diary days failed
//        if (foodDiaryState is FoodDiaryFailed) {
//          return ErrorPage(
//            error: foodDiaryState.error.toString(),
//            trace: foodDiaryState.stacktrace.toString()
//          );
//        }
//
//        // Food diary is loaded from now on
//        assert(foodDiaryState is FoodDiaryLoaded);
//
//        final loadedState = foodDiaryState as FoodDiaryLoaded;
//
//        return Scaffold(
//          appBar: AppBar(
//            title: Text(
//              "Diary",
//              style: Theme.of(context).textTheme.title,
//            ),
//            actions: <Widget>[
//              Text("current page: ${loadedState.currentDate}", style: TextStyle(color: Colors.black),)
//              //controller.animateToPage(124, duration: const Duration(seconds: 1), curve: const ElasticInCurve())
//            ],
//          ),
//          // OPTIMIZE: DON'T REBUILD THIS - it recreates every food diary day bloc!
//          body: PageView.builder(
//            key: GlobalKey(), // OPTIMIZE: trying to fix performance!
//            controller: controller,
//            onPageChanged: (int page) => BlocProvider.of<FoodDiaryBloc>(context).dispatch(UpdateCurrentDate((b) => b
//              ..currentDate = page
//            )),
//            itemBuilder: (BuildContext context, int page) {
//              return BlocProvider<FoodDiaryDayBloc>(
//                key: ValueKey(page), // OPTIMIZE: is this necessary? // TODOCUMENT
//                builder: (BuildContext context) => FoodDiaryDayBloc(
//                  date: page,
//                  foodDiaryBloc: BlocProvider.of<FoodDiaryBloc>(context),
//                )..dispatch(InitFoodDiaryDay()),
//                child: FoodDiaryDayPage(),
//              );
//            }
//          )
//        );
//      }
//    );
  }
}

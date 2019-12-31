/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc_logging/bloc_logging.dart';
import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:diet_driven/navigation/navigation.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/utils/utils.dart';
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
  PageController _controller;

  @override
  void initState() {
    super.initState();
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
      appBar: FoodDiaryAppBar(
        controller: _controller,
        initialDate: widget.initialDate,
      ),
      body: PageView.builder(
        controller: _controller,
        itemBuilder: (BuildContext context, int page) {
          // Food diary day is agnostic to how food diary bloc data is sourced
          final blocProviders = MultiBlocProvider(
            providers: [
              BlocProvider<FoodDiaryDayBloc>(create: (context) =>
                FoodDiaryDayBloc(
                  date: page,
                  foodDiaryBloc: BlocProvider.of<FoodDiaryBloc>(context),
                  diaryRepository: RepositoryProvider.of<DiaryRepository>(context),
                )..add(InitFoodDiaryDay())
              ),
            ],
            child: FoodDiaryDayPage(),
          );

          // TODO: rename to daysBehind?
          final daysAheadOfToday = page - DateTime.now().asInt;

          // Ongoing subscription starts a month ago from today
          if (daysAheadOfToday >= -30) {
            return blocProviders;
          }
          // Historical food diary bloc
          else {
            return BlocProvider<FoodDiaryBloc>(
              create: (BuildContext context) => FoodDiaryBloc(
                diaryRepository: RepositoryProvider.of<DiaryRepository>(context),
                date: page,
              )..add(InitFoodDiary((b) => b
                ..userId = BlocProvider.of<UserDataBloc>(context).userId
              )),
              child: blocProviders,
            );
          }
        },
      ),
    );
  }
}

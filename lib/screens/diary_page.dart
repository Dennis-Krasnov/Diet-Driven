import 'package:diet_driven/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FoodDiaryBloc _foodRecordBloc = BlocProvider.of<FoodDiaryBloc>(context);
    final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Diary")),
      body: BlocBuilder<FoodDiaryEvent, FoodDiaryState>(
        bloc: _foodRecordBloc,
        builder: (BuildContext context, FoodDiaryState state) {
          return Center(
            child: Text(
              'food records: ${state is FoodDiaryLoaded ? state.foodDiaryDays : "it's not loaded!"}',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _foodRecordBloc.dispatch(AddFoodRecord((b) => b..foodRecord = FoodRecord((b) => b..foodName = "##@").toBuilder()));
//                _counterBloc.dispatch(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                _foodRecordBloc.dispatch(LoadFoodRecordDays());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.update),
              onPressed: () {
                _themeBloc.dispatch(ThemeEvent.toggle);
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class DiaryPage extends StatefulWidget {
  final FoodDiaryBloc foodDiaryBloc;

  const DiaryPage({Key key, @required this.foodDiaryBloc}) : super(key: key);

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  FoodDiaryBloc get _foodDiaryBloc => widget.foodDiaryBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDiaryEvent, FoodDiaryState>(
      bloc: _foodDiaryBloc,
      builder: (BuildContext context, FoodDiaryState state) {
        if (state is FoodDiaryUninitialized) {
          return Scaffold(appBar: AppBar(title: Text("Diary loading")), body: Center(child: CircularProgressIndicator()), floatingActionButton: FAB());
        }
        if (state is FoodDiaryFailed) {
          return Scaffold(appBar: AppBar(title: Text("Diary failed")), body: Center(child: Text("Failed... ${state.error}")));
        }
        if (state is FoodDiaryLoaded) {
          return Scaffold(
            appBar: AppBar(title: Text("Diary")), // TODO: date!!
            body: Center(
              child: Column(
                children: state.foodDiaryDay.foodRecords.map((foodRecord) =>
                  FoodRecordTile(
                    foodRecord,
                    deleteFoodRecord: () => _foodDiaryBloc.dispatch(DeleteFoodRecord((b) => b
                      ..foodRecord = foodRecord.toBuilder()
                    )),
                    editFoodRecord: (newRecord) => _foodDiaryBloc.dispatch(EditFoodRecord((b) => b
                      ..oldRecord = foodRecord.toBuilder()
                      ..newRecord = newRecord.toBuilder()
                    )),
                  )
                ).toList(),
              ),
            ),
            floatingActionButton: FAB(addFoodRecord: () =>
              _foodDiaryBloc.dispatch(AddFoodRecord((b) => b
                ..foodRecord = FoodRecord((b) => b
                  ..foodName = "IT'S NEW ${Random().nextInt(200)}"
                ).toBuilder()
              ))
            ),
          );
        }
      }
    );
  }
}

class FoodRecordTile extends StatelessWidget {
  final FoodRecord foodRecord;
  final VoidCallback deleteFoodRecord;
  final void Function(FoodRecord) editFoodRecord;

  // alternatively:
//  typedef Int2VoidFunc = void Function(int);
// or: typedef void Int2VoidFunc(int arg);

  FoodRecordTile(this.foodRecord, {@required this.deleteFoodRecord, @required this.editFoodRecord});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.delete),
        onPressed: deleteFoodRecord
      ),
      title: Text(foodRecord.foodName),
      subtitle: Text("50 grams"),
      onTap: () => editFoodRecord(foodRecord.rebuild((b) => b
        ..foodName = "IT'S NEW ${Random().nextInt(200)}"
      )),
    );
  }
}


void _onWidgetDidBuild(Function callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

class FAB extends StatelessWidget {
  final VoidCallback addFoodRecord;

  const FAB({Key key, @required this.addFoodRecord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);
//    final FoodDiaryBloc _foodDiaryBloc = BlocProvider.of<FoodDiaryBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: Icon(Icons.add),
//            onPressed: () => addFoodRecord()
            onPressed: addFoodRecord
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: Icon(Icons.update),
            onPressed: () {
              _themeBloc.dispatch(ThemeEvent.toggleDarkTheme);
            },
          ),
        ),
      ],
    );
  }
}

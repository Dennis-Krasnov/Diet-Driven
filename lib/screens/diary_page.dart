import 'package:diet_driven/screens/food_record_edit.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:diet_driven/screens/food_logging.dart';
import 'package:diet_driven/widgets/food_record_tile.dart';
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
          return Scaffold(appBar: AppBar(title: Text("Diary loading")), body: Center(child: CircularProgressIndicator()));
        }
        if (state is FoodDiaryFailed) {
          return Scaffold(appBar: AppBar(title: Text("Diary failed")), body: Center(child: Text("Failed... ${state.error}")));
        }
        if (state is FoodDiaryLoaded) {
          return Scaffold(
            appBar: AppBar(title: Text("Diary")), // TODO: date!!
            body: Center(
              child: Column(
                children: [
                  for (var foodRecord in state.foodDiaryDay.foodRecords)
                    FoodRecordTile(
                      foodRecord,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => // Passing original context
                          FoodRecordEdit(
                            foodRecord: foodRecord,
                            saveAction: (newRecord) => _foodDiaryBloc.dispatch(EditFoodRecord((b) => b
                              ..oldRecord = foodRecord.toBuilder()
                              ..newRecord = newRecord.toBuilder()
                              ..completer = infoSnackBarCompleter(context, "${foodRecord.uuid} saved", popNTimes: 1)
                            )),
                            explicitFabAction: true,
                          ),
                        )),
                      onLongPress: () => _foodDiaryBloc.dispatch(DeleteFoodRecord((b) => b
                        ..foodRecord = foodRecord.toBuilder()
                        ..completer = undoSnackBarCompleter(
                          context,
                          "food record deleted",
                          onUndo: () => _foodDiaryBloc.dispatch(AddFoodRecord((b) => b
                            ..foodRecord = foodRecord.toBuilder()
                          ))
                        )
                      )),
                    )
                ]
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>
                    FoodLogging(),
                  )
                );
              }
            ),
          );
        }
      }
    );
  }
}

void _onWidgetDidBuild(Function callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

//class FAB extends StatelessWidget {
//  final VoidCallback addFoodRecord;
//
//  const FAB({Key key, @required this.addFoodRecord}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);
////    final FoodDiaryBloc _foodDiaryBloc = BlocProvider.of<FoodDiaryBloc>(context);
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.end,
//      mainAxisAlignment: MainAxisAlignment.end,
//      children: <Widget>[
//        Padding(
//          padding: EdgeInsets.symmetric(vertical: 5.0),
//          child: FloatingActionButton(
//            child: Icon(Icons.add),
////            onPressed: () => addFoodRecord()
//            onPressed: addFoodRecord
//          ),
//        ),
//        Padding(
//          padding: EdgeInsets.symmetric(vertical: 5.0),
//          child: FloatingActionButton(
//            child: Icon(Icons.update),
//            onPressed: () {
//              _themeBloc.dispatch(ThemeEvent.toggleDarkTheme);
//            },
//          ),
//        ),
//      ],
//    );
//  }
//}



//                _foodDiaryBloc.dispatch(AddFoodRecord((b) => b
//                  ..foodRecord = FoodRecord((b) => b
//                    ..foodName = "IT'S NEW ${Random().nextInt(200)}"
//                  ).toBuilder()
//                ));


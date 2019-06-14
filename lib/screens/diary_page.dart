import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/global_navigation.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:diet_driven/widgets/food_record_tile.dart';
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
          return Scaffold(appBar: AppBar(title: const Text("Diary loading")), body: Center(child: const CircularProgressIndicator()));
        }
        if (state is FoodDiaryFailed) {
          return Scaffold(appBar: AppBar(title: const Text("Diary failed")), body: Center(child: Text("Failed... ${state.error}")));
        }
        if (state is FoodDiaryLoaded) {
          return Scaffold(
            appBar: AppBar(title: const Text("Diary")), // TODO: date!! // TODO: click to go to info!
            body: Center(
              child: Column(
                children: [
                  Text("You've eaten ${state.foodDiaryDay.foodRecords.fold<num>(0, (prev, e) => prev + (e?.calories ?? 0))} out of ${state.diet.calories} calories"),
                  for (var foodRecord in state.foodDiaryDay.foodRecords)
                    FoodRecordTile(
                      foodRecord,
                      onTap: () async {
                        FoodRecord modified = await Navigator.of(context).pushNamed<FoodRecord>(
                          GlobalNavigation.manualFoodRecordEditor,
                          arguments: foodRecord
                        );

                        if (modified != null) {
                          _foodDiaryBloc.dispatch(ReplaceFoodRecord((b) => b
                            ..oldRecord = foodRecord.toBuilder()
                            ..newRecord = modified.toBuilder()
                            ..completer = infoSnackBarCompleter(context, "${foodRecord.uuid} saved")
                          ));
                        }
                      },
//                      onLongPress: () => _foodDiaryBloc.dispatch(DeleteFoodRecord((b) => b
//                        ..foodRecord = foodRecord.toBuilder()
//                        ..completer = undoSnackBarCompleter(
//                          context,
//                          "food record deleted",
//                          onUndo: () => _foodDiaryBloc.dispatch(AddFoodRecord((b) => b
//                            ..foodRecord = foodRecord.toBuilder()
//                          ))
//                        )
//                      )),
                    )
                ]
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                // FIXME - doesn't include DiaryBlocProvider - do I need a bloc builder?
                BuiltList<FoodRecord> result = await Navigator.of(context).pushNamed<BuiltList<FoodRecord>>(
                  "/food_logging",
                  arguments: state
                );

                if (result != null) {
                  _foodDiaryBloc.dispatch(AddFoodRecords((b) => b
                    ..foodRecords = result.toBuilder()
  //                  TODO completer
                  ));
                }
//                Navigator.of(context).push(
//                  MaterialPageRoute(builder: (context) =>
//                    FoodLogging(),
//                  )
//                );
              }
            ),
          );
        }
      }
    );
  }
}
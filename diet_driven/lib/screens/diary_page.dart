import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/global_navigation.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:diet_driven/widgets/food_record_tile.dart';
import 'package:diet_driven/blocs/blocs.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FoodDiaryBloc _foodDiaryBloc = BlocProvider.of<FoodDiaryBloc>(context);

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
            appBar: AppBar(
              title: const Text("Diary"),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
                    ..deepLink = DiarySettingsDeepLink()
                  )),
                )
              ],
            ),
            // TODO: date!! // TODO: click to go to info!
            body: Center(
              child: Column( // TODO: sliver
                children: [
                  Text("You've eaten ${state.foodDiaryDay.foodRecords.fold<num>(0, (prev, e) => prev + (e?.calories ?? 0))} out of ${state.diet.calories} calories"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8.0),
                    child: Text("Breakfast", style: Theme.of(context).textTheme.headline),
                  ),
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
              child: const Icon(Icons.add),
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

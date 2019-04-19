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

//  @override
//  void initState() {
//    super.initState();

    // Create local bloc instance if no bloc was injected
    // FIXME: should somehow know about user, repository!!
//    _foodDiaryBloc = widget.foodDiaryBloc ?? FoodDiaryBloc(diaryRepository: diaryRepository, userId: "Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", daysSinceEpoch: 124);
//    _foodDiaryBloc = widget.foodDiaryBloc ?? FoodDiaryBloc(diaryRepository: DiaryRepository(), userId: "Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", daysSinceEpoch: 124);
//  }

  // TODOCUMENT: not disposing at all!

//  @override
//  void dispose() {
    // Dispose local bloc instance
//    if (!isInjectedBloc) {
//      _foodDiaryBloc.dispose();
//    }

//    super.dispose();
//  }

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
        if (state is FoodDiaryReady) {
          return Scaffold(
            appBar: AppBar(title: Text("Diary")), // TODO: date!!
            body: Center(
              child: StreamBuilder<FoodDiaryDay>(
                stream: state.diaryDayStream,
                builder: (BuildContext context, AsyncSnapshot<FoodDiaryDay> snapshot) {
                  // For debugging
//                  showSubscriptionErrorMessages(snapshot.connectionState, context);

                  // TODO: show skeleton widgets
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  return Column(
                    children: state.diaryDayStream.value.foodRecords.map((foodRecord) =>
                     // TODO: pass on update callback
                      FoodRecordTile(foodRecord, () => _foodDiaryBloc.dispatch(DeleteFoodRecord((b) => b..foodRecord = foodRecord.toBuilder())))
                    ).toList(),
                  );
                }
              )
            ),
            floatingActionButton: FAB(),
          );
        }
      }
    );
  }
}

class FoodRecordTile extends StatelessWidget {
  final FoodRecord foodRecord;
  final VoidCallback deleteFoodRecord; // TODO: named param

  FoodRecordTile(this.foodRecord, this.deleteFoodRecord);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.delete),
        onPressed: deleteFoodRecord
      ),
      title: Text(foodRecord.foodName),
      subtitle: Text("50 grams"),
      onTap: () {
        
      },
    );
  }
}


void _onWidgetDidBuild(Function callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

class FAB extends StatelessWidget {
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
            onPressed: () {
              // TODO: create diary day bloc!
//              _foodDiaryBloc.dispatch(AddFoodRecord((b) => b..foodRecord = FoodRecord((b) => b..foodName = "##@").toBuilder()));
//                _counterBloc.dispatch(CounterEvent.increment);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
//              _foodDiaryBloc.dispatch(LoadFoodRecordDays());
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
    );
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/food_diary_day/food_diary_day.dart';
import 'package:diet_driven/models/models.dart';

class FoodDiaryDayBloc extends Bloc<FoodDiaryDayEvent, FoodDiaryDayState> {
  /// All food diary days.
  final FoodDiaryBloc foodDiaryBloc;

  /// Food diary day's date.
  final int date;

  StreamSubscription<FoodDiaryDayEvent> _foodDiaryDayEventSubscription;

  FoodDiaryDayBloc({@required this.foodDiaryBloc, @required this.date})
    : assert(foodDiaryBloc != null), assert(date != null);

  @override
  FoodDiaryDayState get initialState => FoodDiaryDayUninitialized(); // TOTEST: ensure initialized when bloc is created

  @override
  void dispose() {
    _foodDiaryDayEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<FoodDiaryDayState> mapEventToState(FoodDiaryDayEvent event) async* {
    if (event is InitFoodDiaryDay) {
      assert(currentState is FoodDiaryDayUninitialized);

      _foodDiaryDayEventSubscription = Observable<FoodDiaryState>(foodDiaryBloc.state)
        .ofType(const TypeToken<FoodDiaryLoaded>()) // TODO: similarly implement FilteredLoggingBloc
        .where((loadedDiary) => loadedDiary.diaryDays.containsKey(date))
        .map<FoodDiaryDayEvent>((loadedDiary) => RemoteFoodDiaryDayArrived((b) => b
//          loadedDiary.diaryDays[date]
//          loadedDiary.diets.firstWhere((diary) => diary.startingDate >= date)

          // TODO: list of meals! (group by?)
          // TODO: extract correct meal!
        ))
        .listen(dispatch);
    }

    if (event is RemoteFoodDiaryDayArrived) {
      yield FoodDiaryDayLoaded((b) => b
          ..diet = DietBuilder() // FIXME
//        ..date = 124 // TODO: event parameters
      );
    }
  }
}

// TODO: handle selection mode

//        .map<FoodDiaryDay>((loadedDiary) => loadedDiary.diaryDays[date])
//        .map<FoodDiaryDayEvent>((diaryDay) => RemoteFoodDiaryDayArrived((b) => b

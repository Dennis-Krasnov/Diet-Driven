import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/blocs/food_diary_day/food_diary_day.dart';
import 'package:meta/meta.dart';

class FoodDiaryDayBloc extends Bloc<FoodDiaryDayEvent, FoodDiaryDayState> {
  final FoodDiaryBloc foodDiaryBloc;
  final int date;

  StreamSubscription<FoodDiaryState> foodDiaryStateSubscription;

  FoodDiaryDayBloc({@required this.foodDiaryBloc, @required this.date}) {
    assert(foodDiaryBloc != null);
    assert(date != null);

    foodDiaryBloc.state.listen((state) {
      if (state is FoodDiaryLoaded) {
//        dispatch(RemoteFoodDiaryDayArrived((b) => b
//            ..
//        ));
        LoggingBloc().info("LISTENED TO STATE CHANGE FROM FOOD DIARY DAY");
      }
    });
  }

  @override
  FoodDiaryDayState get initialState => FoodDiaryDayUninitialized();

  @override
  void dispose() {
    super.dispose();
    foodDiaryStateSubscription?.cancel();
  }

  @override
  Stream<FoodDiaryDayState> mapEventToState(FoodDiaryDayEvent event) async* {

  }
}



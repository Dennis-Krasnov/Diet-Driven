import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodLogging extends StatefulWidget {
  final void Function(FoodRecord) addFoodRecord;

  const FoodLogging({Key key, @required this.addFoodRecord}) : super(key: key);

  @override
  _FoodLoggingState createState() => _FoodLoggingState();
}

class _FoodLoggingState extends State<FoodLogging> {
  FoodLoggingBloc _foodLoggingBloc;

  @override
  void initState() {
    super.initState();

    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    String userId = (_userDataBloc.currentState as UserDataLoaded).authentication.uid;
    int daysSinceEpoch = 124; // TODO: take from diary wrapper bloc

    // FIXME
//    foodLoggingBloc = FoodLoggingBloc();
//    _foodLoggingBloc = FoodLoggingBloc(
//      userId: userId,
//      daysSinceEpoch: daysSinceEpoch,
//      meal: 0,
//      diaryRepository: Repository().diary,
//      foodRepository: Repository().food
//    );
  }

  @override
  void dispose() {
    _foodLoggingBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

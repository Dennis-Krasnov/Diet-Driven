import 'dart:math';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodRecordEdit extends StatefulWidget {
  final FoodRecord foodRecord;
//  final void Function(FoodRecord) editFoodRecord;

  FoodRecordEdit({Key key, @required this.foodRecord}) : assert(foodRecord != null), super(key: key);

  @override
  _FoodRecordEditState createState() => _FoodRecordEditState();
}

class _FoodRecordEditState extends State<FoodRecordEdit> {
  FoodRecordEditBloc _foodRecordEditBloc;
  // TODO: text controllers => sub = controllers.listen((val) => dispatch(event(val)))
  // sub.cancel()

  @override
  void initState() {
    super.initState();

    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    String userId = (_userDataBloc.currentState as UserDataLoaded).authentication.uid;
    int daysSinceEpoch = 124; // TODO: take from diary wrapper bloc

    _foodRecordEditBloc = FoodRecordEditBloc(
      initialFoodRecord: widget.foodRecord,
      userId: userId,
      daysSinceEpoch: daysSinceEpoch,
      diaryRepository: Repository().diary
    );
  }

  @override
  void dispose() {
    _foodRecordEditBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodRecordEditEvent, FoodRecordEditState>( // TODO: place user data before theme (config => userData => theme) so that theme change doesn't trigger user data fetch
      bloc: _foodRecordEditBloc,
      key: Key('please work'),
      builder: (BuildContext context, FoodRecordEditState foodRecordEditState) {
        return Scaffold(
          key: Key('please work 2'),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("UUID: ${foodRecordEditState.foodRecord.uuid}"),
                Text("food name: ${foodRecordEditState.foodRecord.foodName}"),
                Text("quantity: ${foodRecordEditState.foodRecord.quantity}"),
                RaisedButton(
                  child: Text("Randomize!"),
                  onPressed: () => _foodRecordEditBloc.dispatch(UpdateQuantity((b) => b
                    ..quantity = Random().nextInt(500))
                  ),
                ),
                RaisedButton(
                  child: Text("Save and exit"),
                  onPressed: () {
                    _foodRecordEditBloc.dispatch(SaveFoodRecord());
                    Navigator.of(context).pop();
                  }
                )
              ],
            ),
          )
        );
      }
    );

  }
}

import 'dart:math';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodRecordEdit extends StatefulWidget {
  final FoodRecord foodRecord;
  final void Function(FoodRecord) editFoodRecord;

  const FoodRecordEdit({Key key, @required this.foodRecord, @required this.editFoodRecord}) : super(key: key);

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
    // FIXME: direct access to diary repository instead?
    _foodRecordEditBloc = FoodRecordEditBloc(widget.foodRecord, editFoodRecord: widget.editFoodRecord);
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

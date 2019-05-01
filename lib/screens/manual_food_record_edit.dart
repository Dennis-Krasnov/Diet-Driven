import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/widgets/number_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManualFoodRecordEdit extends StatefulWidget {
  final FoodRecord foodRecord;
  final bool deletable;

  ManualFoodRecordEdit({
    Key key,
    @required this.foodRecord,
    @required this.deletable
  }) :
      assert(foodRecord != null),
      assert(deletable != null),
      super(key: key);

  @override
  _ManualFoodRecordEditState createState() => _ManualFoodRecordEditState();
}

class _ManualFoodRecordEditState extends State<ManualFoodRecordEdit> {
  FoodRecordEditBloc _foodRecordEditBloc;

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
      diaryRepository: Repository().diary,
    );
  }

  @override
  void dispose() {
    _foodRecordEditBloc.dispose();
//    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodRecordEditEvent, FoodRecordEditState>(
      bloc: _foodRecordEditBloc,
      builder: (BuildContext context, FoodRecordEditState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${state.foodRecord.foodName}"),
            actions: <Widget>[
              if (widget.deletable)
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _foodRecordEditBloc.dispatch(DeleteFoodRecord());
                    Navigator.of(context).pop<FoodRecord>(null);
                  },
                )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("UUID: ${state.foodRecord.uuid}"),
                Text("food name: ${state.foodRecord.foodName}"),
                NumberFormField(
                  value: state.foodRecord.quantity,
                  minValue: 0,
                  maxValue: 100000,
                  decimalPlaces: 1, // TODO: 0 if grams are selected, 1 otherwise
                  labelText: "Quantity",
                  icon: Icon(Icons.functions),
                  textInputAction: TextInputAction.done, // pops with result!
                  errorText: state.quantityError,
                  autofocus: true,
                  onChanged: (number) => _foodRecordEditBloc.dispatch(UpdateQuantity((b) => b
                    ..quantity = number
                  ))
                ),
                // TODO: portion size's 'next' textInputAction focuses on quantity
                Text("quantity: ${state.foodRecord.quantity}"),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () {
              assert(Navigator.of(context).canPop());

              if (widget.foodRecord != state.foodRecord) {
                Navigator.of(context).pop<FoodRecord>(state.foodRecord);
              }
              // Nothing changed
              else {
                Navigator.of(context).pop<FoodRecord>(null);
              }
            }
//            onPressed: () => _foodRecordEditBloc.dispatch(SaveFoodRecord()) // TODO: live does this instead of pop
          )
        );
      }
    );
  }
}

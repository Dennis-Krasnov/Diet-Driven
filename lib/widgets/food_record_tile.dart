import 'package:flutter/material.dart';

import 'package:diet_driven/screens/food_record_edit.dart';
import 'package:diet_driven/models/models.dart';

class FoodRecordTile extends StatelessWidget {
  final FoodRecord foodRecord;
  final VoidCallback deleteFoodRecord;
  final void Function(FoodRecord) editFoodRecord;

  FoodRecordTile(this.foodRecord, {@required this.deleteFoodRecord, @required this.editFoodRecord});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.delete),
        onPressed: deleteFoodRecord
      ),
      title: Text(foodRecord.foodName),
      subtitle: Text("${foodRecord.quantity} grams"),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>
            FoodRecordEdit(
              foodRecord: foodRecord,
//              editFoodRecord: (foodRecord) => editFoodRecord(foodRecord),
              key: Key(foodRecord.uuid),
            ),
            maintainState: true
          )
        );
      },
    );
  }
}

import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';
import 'package:rxdart/rxdart.dart';

class DiaryRepository {
  final EdamamProvider _edamamProvider = EdamamProvider();
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

  ///
  Future<void> saveDiaryDay(String userId, FoodDiaryDay foodDiaryDay) {
    return _firestoreProvider.setFoodDiaryDay(userId, foodDiaryDay);
  }

  ///
  Future<void> deleteDiaryDay(String userId, int daysSinceEpoch) {
    return _firestoreProvider.deleteFoodDiaryDay(userId, daysSinceEpoch);
  }

  ///
  Future<void> addFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {  // OPTIMIZE: pass FoodDiaryDay instead?!
    // TODO: create day if doesn't exist
    return _firestoreProvider.addFoodRecord(userId, daysSinceEpoch, foodRecord);
  }

  ///
  Future<void> deleteFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    // TODO: delete day if no more food records???
    return _firestoreProvider.deleteFoodRecord(userId, daysSinceEpoch, foodRecord);
  }

  ///
  Future<void> editFoodRecord(String userId, int daysSinceEpoch, FoodRecord oldRecord, FoodRecord newRecord) {
    // TODO: throw if day if doesn't exist
    return _firestoreProvider.editFoodRecord(userId, daysSinceEpoch, oldRecord, newRecord);
  }

  ///
  ValueObservable<FoodDiaryDay> streamDiaryDay(String userId, int daysSinceEpoch) {
    return _firestoreProvider.streamFoodDiaryDay(userId, daysSinceEpoch).shareValue();
  }

  ///
  ValueObservable<BuiltList<FoodDiaryDay>> streamDiary(String userId) {
//    testing:
//    return BehaviorSubject<BuiltList<FoodDiaryDay>>()..close(); // subscription ended error message
//    return BehaviorSubject<BuiltList<FoodDiaryDay>>()..add(null); // continuously waits

    // assign only if it's null
//    foodDiaryValue ??= _firestoreProvider.foodDiary(userId).shareValue(); // delay(Duration(seconds: 3)).
    // Don't cache observable result
    return _firestoreProvider.streamFullFoodDiary(userId).shareValue();
  }

  Future<BuiltList<FoodDiaryDay>> getDiary(String userId) {
    return _firestoreProvider.getFullFoodDiary(userId);
  }
}

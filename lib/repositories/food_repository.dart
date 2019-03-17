import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';
import 'package:rxdart/rxdart.dart';

class FoodRepository {
  final EdamamProvider _edamamProvider = EdamamProvider();
  final FirestoreProvider _firestoreProvider = FirestoreProvider();
  final RemoteConfigProvider _remoteConfigProvider = RemoteConfigProvider();

  ///
  Future<void> foodDiaryUpdate(String userId, int daysSinceEpoch, FoodDiaryDay foodDiaryDay) {
    return _firestoreProvider.foodDiaryUpdate(userId, daysSinceEpoch, foodDiaryDay);
  }

  ///
  Future<void> foodDiaryDelete(String userId, int daysSinceEpoch) {
    return _firestoreProvider.foodDiaryDelete(userId, daysSinceEpoch);
  }

  /// TODO: get last element of stream, convert to normal data!!! - no stream builder needed! (could come from non-stream)
//  BehaviorSubject<BuiltList<FoodDiaryDay>>
//  A special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener
  Stream<BuiltList<FoodDiaryDay>> foodDiaryList(String userId) {
    return _firestoreProvider.foodDiaryList(userId); //.last;
  }

//  Future<FoodRecordComplete> // just a bunch of nullable stats instead !!!
  Future<FoodRecord> foodRecordInfo(FoodRecord foodRecord) {
    // Cached server, edamam, load food statistics, history, pictures, everything about it
//    final EdamamData = await _edamamProvider.info(foodRecord.edamamId); // if it exists...
    return Future.value(foodRecord);
  }

//  Future<Data> getAllDataThatMeetsRequirements() async {
//    final RawDataA dataSetA = await dataProviderA.readData();
//    final RawDataB dataSetB = await dataProviderB.readData();
//
//    final Data filteredData = _filterData(dataSetA, dataSetB);
//    return filteredData;
//  }
}
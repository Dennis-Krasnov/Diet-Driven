library repositories;

import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';
import 'package:meta/meta.dart';


class Repository {
  final EdamamProvider _edamamProvider = EdamamProvider();
  final FirebaseAuthProvider _firebaseAuthProvider = FirebaseAuthProvider();
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

class UserRepository {
  Future<String> authenticate({@required String username, @required String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
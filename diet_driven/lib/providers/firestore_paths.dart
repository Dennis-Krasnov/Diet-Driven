
///
class FirestorePaths {
  ///
  static String user(String userId) => "users/$userId";

  ///
  static String foodDiary(String userId, int daysSinceEpoch) => "${user(userId)}/food_diary/$daysSinceEpoch";
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

/// Firestore document and collection path constants.
class FirestorePaths {
  /// Global configuration collection
  static String configuration() => "config";

  /// Global default settings
  static String defaultSettings() => "${configuration()}/default_settings";


  /// [userId]'s base path and read-only user document.
  static String user(String userId) => "users/$userId";

  /// [userId]'s configuration collection.
  static String userConfiguration(String userId) => "${user(userId)}/metadata";

  /// [userId]'s settings document.
  static String userSettings(String userId) => "${userConfiguration(userId)}/settings";


  // TODO: make daysSinceEpoch an optional parameter?? - use , [int daysSinceEpoch]
  /// [userId]'s food diary.
  static String foodDiary(String userId) => "${user(userId)}/food_diary";

  /// [userId]'s food diary on [daysSinceEpoch].
  static String foodDiaryDay(String userId, int daysSinceEpoch) => "${foodDiary(userId)}/$daysSinceEpoch";
}

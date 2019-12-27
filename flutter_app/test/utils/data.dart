/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';

final eventFailedException = Exception("Event failed");

const date = 1323;

const mealIndex = 2;

final defaultRemoteConfig = RemoteConfiguration();

final remoteConfig = RemoteConfiguration((b) => b
  ..liveConfiguration = true
  ..bonus = 35
);

final packageInfo = PackageInformation((b) => b
  ..appName = "Diet Driven"
  ..packageName = "diet_driven"
  ..version = "1.2.3"
  ..buildNumber = "14"
);

final connectivityList = [
  ConnectivityStatus.disconnected,
  ConnectivityStatus.wifi,
  ConnectivityStatus.mobile,
];

final userA = Authentication((b) => b
  ..uid = "1234"
  ..isAnonymous = true
  ..isEmailVerified = false
);

final userB = Authentication((b) => b
  ..uid = "6789"
  ..isAnonymous = true
  ..isEmailVerified = false
);

// TODO: different values for user document
final userDocument = UserDocument();

final settingsLight = Settings((b) => b
  ..theme = ThemeSettings((b) => b
    ..darkMode = false
  ).toBuilder()
);

final settingsDark = Settings((b) => b
  ..theme = ThemeSettings((b) => b
    ..darkMode = true
  ).toBuilder()
);

final Settings settingsFull = Settings((b) => b
    ..navigation = NavigationSettings((b) => b
//      ..defaultPage = DiaryDateDL.today()
//      ..bottomNavigationPages = ListBuilder(<DeepLink>[
//        DiaryDateDL.today(),
//        MeasureDL(),
//        ReportsDL(),
//        UserDL("TODO"),
//      ])
  ).toBuilder()
  ..theme = ThemeSettings((b) => b
    ..darkMode = false
    ..primaryColour = "dark blue"
  ).toBuilder()
);

final foodRecords = BuiltList<FoodRecord>(<FoodRecord>[
  FoodRecord.random(),
  FoodRecord.random(),
]);

final searchSuggestions = BuiltList<FoodRecord>(foodRecords.reversed.expand<FoodRecord>((e) => [e, e]));

final searchResults = SearchResult((b) => b
  ..foods = ListBuilder<FoodRecord>(foodRecords.reversed.take(1))
  ..pagination = 0
);

final dietA = Diet((b) => b
  ..idealNutrients = NutrientMap.random()
  ..startDate = 0
);

final dietB = Diet((b) => b
  ..idealNutrients = NutrientMap.random()
  ..startDate = 100
);

FoodDiaryDay generateFoodDiaryDay(int date, List<List<String>> foodNames) {
  return FoodDiaryDay((b) => b
    ..date = date
    ..meals = BuiltList<MealData>(<MealData>[
      for (final meal in foodNames)
        MealData((b) => b
          ..foodRecords = ListBuilder(<FoodRecord>[
            for (final name in meal)
              FoodRecord((b) => b
                ..foodName = name
                ..totalNutrients = NutrientMap.fromMacros(1, 2, 3)
              ),
          ]),
        )
    ])
  );
}
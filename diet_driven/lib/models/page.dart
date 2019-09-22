/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:diet_driven/blocs/blocs.dart';

part 'page.g.dart';

/// Bottom navigation pages.
class Page extends EnumClass {
  static Serializer<Page> get serializer => _$pageSerializer;

  /// ...
  static const Page diary = _$diary;

  /// ...
  static const Page track = _$track;

  /// ...
  static const Page reports = _$reports;

  /// ...
  static const Page recipes = _$recipes;

  /// ...
  static const Page settings = _$settings;

  /// ...
  static const Page logging = _$logging;

  /// ... SOFT, initial route / switching tabs doesn't reset sub navigation!
  NavigationEvent get navigationEvent {
    switch (this) {
      case diary:
        return NavigateToDiary();
        break;
      case track:
        return NavigateToTrack();
        break;
      case reports:
        return NavigateToReports();
        break;
      case settings:
        return NavigateToSettings();
        break;
      case logging:
        return NavigateToLogging();
        break;
      default:
        throw UnimplementedError();
    }
  }

  NavigationState get navigationState {
    switch (this) {
      case diary:
        return DiaryTab();
        break;
      case track:
        return TrackTab();
        break;
      case reports:
        return ReportsTab();
        break;
      case settings:
        return SettingsTab();
        break;
      case logging:
        return LoggingTab();
        break;
      default:
        throw UnimplementedError();
    }
  }
  
  const Page._(String name) : super(name);

  static BuiltSet<Page> get values => _$values;
  static Page valueOf(String name) => _$valueOf(name);
}

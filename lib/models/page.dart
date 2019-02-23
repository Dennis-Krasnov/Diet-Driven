library page;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'page.g.dart';

///
class Page extends EnumClass {
  //
  static const Page diary = _$diary;

  //
  static const Page track = _$track;

  //
  static const Page diet = _$diet;

  //
  static const Page goals = _$goals;

  //
  static const Page settings = _$settings;

  //
  static const Page adherence = _$adherence;

  //
  static const Page statistics = _$statistics;

  //
  static const Page manual = _$manual;

  //
//  static const AppTab recipes = _$recipes;


  static const Page loginScreen = _$loginScreen;

  // All pages except login screen, nested navigator inside of login screen?
  static List<Page> inApp = Page.values.where((p) => p != loginScreen).toList();


  const Page._(String name) : super(name);

  static BuiltSet<Page> get values => _$appTabValues;

  static Page valueOf(String name) => _$appTabValueOf(name);
}
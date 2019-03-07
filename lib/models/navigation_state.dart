library navigation_state;

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/data/page.dart';
import 'package:diet_driven/models/user_state.dart';
import 'package:diet_driven/util/built_firestore.dart';

part 'navigation_state.g.dart';

///
abstract class NavigationState with SettingsDocument implements Built<NavigationState, NavigationStateBuilder> {
  static Serializer<NavigationState> get serializer => _$navigationStateSerializer;

  //
  @BuiltValueField(serialize: false)
  @nullable // settings received middleware sets active page as default page
  Page get activePage;

  //
  Page get defaultPage;

  //
//  @BuiltValueField(serialize: false) // FIXME: No serializer for 'List<Page>
  BuiltList<Page> get bottomNavigation;

  //
  @BuiltValueField(serialize: false)
  @nullable // settings received middleware sets bottom navigation page as default page
  Page get bottomNavigationPage;

  NavigationState._();
  factory NavigationState([updates(NavigationStateBuilder b)]) = _$NavigationState;
}

///
abstract class NavigationStateBuilder implements Builder<NavigationState, NavigationStateBuilder> {
  Page activePage;

  Page defaultPage = Page.diary;

  BuiltList<Page> bottomNavigation = BuiltList.from([Page.diary, Page.track, Page.diet, Page.goals, Page.settings]);

  @nullable // due to goTo being called form initApp
  Page bottomNavigationPage;

  factory NavigationStateBuilder() = _$NavigationStateBuilder;
  NavigationStateBuilder._();
}
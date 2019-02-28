library bottom_nav;

import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/containers/active_page.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'bottom_nav.g.dart';

/// Bottom navigation for app
class BottomNav extends StoreConnector<AppState, Actions, BottomNavigationVM> {

  @override
  BottomNavigationVM connect(AppState state) {
    return BottomNavigationVM((b) => b
      ..pages = state.navigation.bottomNavigation
    );
  }

  @override
  Widget build(BuildContext context, BottomNavigationVM vm, Actions actions) =>
    ActivePage(builder: (BuildContext context, Page activePage) {
      return BottomNavigationBar(
        onTap: (index) => actions.navigation.goTo(vm.pages[index]),
        type: BottomNavigationBarType.fixed,
        // Current page no longer in bottom navigation, reset to first page
        currentIndex: vm.pages.contains(activePage) ? vm.pages.indexOf(activePage) : 0,
        items: vm.pages.map((page) => BottomNavigationBarItem(
          title: Text(
            PageFactory.toText(page),
            style: TextStyle(
              fontFamily: "SourceSansPro",
//              fontWeight: FontWeight.w700
              fontSize: 16
            ),
          ),
          icon: PageFactory.toIcon(page),
        )).toList()
      );
    });
}

// TODO: don't need VM if single property
abstract class BottomNavigationVM implements Built<BottomNavigationVM, BottomNavigationVMBuilder> {
  List<Page> get pages;

  BottomNavigationVM._();

  factory BottomNavigationVM([updates(BottomNavigationVMBuilder b)]) =
      _$BottomNavigationVM;
}
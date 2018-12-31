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

class BottomNav extends StoreConnector<AppState, Actions, BottomNavigationVM> {
//  @override
//  List<Page> connect(AppState state) => state.bottomNavigation;

  @override
  BottomNavigationVM connect(AppState state) {
    return BottomNavigationVM((b) => b
      ..pages = state.bottomNavigation
      ..show = state.showBottomNavigation);
  }

  @override
  Widget build(BuildContext context, BottomNavigationVM vm, Actions actions) =>
      ActivePage(builder: (BuildContext context, Page activePage) {
        return Visibility(
            visible: vm.show,
            child: BottomNavigationBar(
                onTap: (index) => actions.updateTab(vm.pages[index]),
                type: BottomNavigationBarType.fixed,
                // Current page no longer in bottom navigation, reset to first page
                currentIndex: vm.pages.contains(activePage) ? vm.pages.indexOf(activePage) : 0,
                items: vm.pages
                    .map((page) => BottomNavigationBarItem(
                          title: Text(PageFactory.toText(page)),
                          icon: PageFactory.toIcon(page),
                        ))
                    .toList()));
      });
}

abstract class BottomNavigationVM
    implements Built<BottomNavigationVM, BottomNavigationVMBuilder> {
  List<Page> get pages;

  bool get show;

  BottomNavigationVM._();

  factory BottomNavigationVM([updates(BottomNavigationVMBuilder b)]) =
      _$BottomNavigationVM;
}

// OLD
//class BottomNav extends StoreConnector<AppState, Actions, List<Page>> {
//  @override
//  List<Page> connect(AppState state) => state.bottomNavigation;
//
//  @override
//  Widget build(BuildContext context, List<Page> pages, Actions actions) =>
//      ActivePage(builder: (BuildContext context, Page activePage) {
//        return BottomNavigationBar(
//            onTap: (index) => actions.updateTab(pages[index]),
//            type: BottomNavigationBarType.fixed,
//            currentIndex: pages.indexOf(activePage),
//            items: pages
//                .map((page) => BottomNavigationBarItem(
//              title: Text(PageFactory.toText(page)),
//              icon: PageFactory.toIcon(page),
//            ))
//                .toList());
//      });
//}

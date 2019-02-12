library diet_page;

import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart' hide Builder;

//part 'diet_page.g.dart';

//class FSConnector extends StatefulWidget implements StoreConnector<AppState, Actions, Page>{
//  @override
//  State<StatefulWidget> createState() => new _FSConnectorState();
//
//}
//
////class _FSConnectorState extends State<FSConnector> implements _StoreConnectorState<AppState, Actions, Page>{
//class _FSConnectorState extends _StoreConnectorState<StoreState, Actions extends ReduxActions, LocalState> {
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//
//}

////////////////
//class DietPage extends StoreConnector<AppState, Actions, DietPageVM> {
//
////  @override
////  void initState() {
////    super.initState();
////    print("before");
////    store.actions.initApp();
////    print("after");
////  }
//
//  // TODO: use connection syntax || implement StoreConnector!!
////  final ReduxProvider reduxProvider = context.inheritFromWidgetOfExactType(ReduxProvider);
//
//  @override
//  DietPageVM connect(AppState state) {
//    return DietPageVM((b) => b..pages = state.bottomNavigation);
//  }
//
//  @override
//  Widget build(BuildContext context, DietPageVM vm, Actions actions) =>
//      Scaffold(
//        body: Container(
//          child: Center(
//            child: Column(),
//          ),
//        ),
//      );
//}
//
//abstract class DietPageVM implements Built<DietPageVM, DietPageVMBuilder> {
//  List<Page> get pages;
//
//  DietPageVM._();
//
//  factory DietPageVM([updates(DietPageVMBuilder b)]) = _$DietPageVM;
//}

class DietPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerNavButton(),
        title: Text(PageFactory.toText(Page.diet)),
      ),
      body: Container(
        color: Colors.pinkAccent,
      ),
    );
  }
}

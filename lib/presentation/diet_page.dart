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

//import 'package:infinity_page_view/infinity_page_view.dart';


class DietPage extends StatelessWidget {
//  final InfinityPageController infinityPageController = new InfinityPageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerNavButton(),
        title: Text(PageFactory.toText(Page.diet)),
      ),
      body: Container()
//      new InfinityPageView(
//        itemBuilder: (BuildContext context, int index) {
//          switch (index) {
//            case 0:
//              return Container(
//                  color: Colors.redAccent
//              );
//            case 1:
//              return Container(
//                color: Colors.blueAccent
//              );
//            case 2:
//              return Container(
//                  color: Colors.orangeAccent
//              );
//          }
//          return Container(
//              color: Colors.black
//          );
//        },
//        itemCount: 3,
//        onPageChanged: (int index) {
//          print("INDEX: $index");
////          setState(() {
////            label = "${index+1}/${itemCount}";
////          });
//        },
//        controller: infinityPageController,
//      ),
//      PageView.builder(
////        itemCount: 2,
//        scrollDirection: Axis.horizontal,
//        itemBuilder: (context, position) {
//          return Container(
//            height: 200,
//            width: 200,
//            color: position % 2 == 0 ? Colors.pink : Colors.cyan,
//          );
//        },
//      ),
    );
  }
}

import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/containers/active_page.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

class HomeScreen extends StatelessWidget {
//  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return ActiveTab(
//      builder: (BuildContext context, AppTab activeTab) {
    return Scaffold(
//      appBar: AppBar(
//            title: Text(BuiltReduxLocalizations.of(context).appTitle),
//        title: Text("title"),
//        actions: [
//          FilterSelector(
//            builder: (context, vm) {
//              return FilterButton(
//                visible: activeTab == AppTab.todos,
//                activeFilter: vm.activeFilter,
//                onSelected: vm.onFilterSelected,
//              );
//            },
//          ),
//          ExtraActionSelector()
//        ],
//      ),
//      body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
        body: ActivePage(
          builder: (BuildContext context, Page activePage) {
            return PageFactory.toPage(activePage);
          }
        ),
//      floatingActionButton: FloatingActionButton(
////        key: ArchSampleKeys.addTodoFab,
//        onPressed: () {
////          Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
//        },
//        child: Icon(Icons.add),
////        tooltip: ArchSampleLocalizations.of(context).addTodo,
//      ),
//      bottomNavigationBar: TabSelector(),
      bottomNavigationBar: BottomNavigation(),
    );
//      },
//    );
  }
}


class BottomNavigation
    extends StoreConnector<AppState, Actions, List<Page>> {

  @override
  List<Page> connect(AppState state) => state.bottomNavigation;

  @override
  Widget build(BuildContext context, List<Page> pages, Actions actions) =>
      ActivePage(
          builder: (BuildContext context, Page activePage) {
            return BottomNavigationBar(
                onTap: (index) => actions.updateTab(pages[index]),
                type: BottomNavigationBarType.fixed,
                currentIndex: pages.indexOf(activePage),
                items: pages.map((page) =>
                    BottomNavigationBarItem(
                        title: Text(PageFactory.toText(page)),
                        icon: PageFactory.toIcon(page),
//                        activeIcon:
                    )
                ).toList()
            );
          }
      );
}
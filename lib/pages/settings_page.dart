library settings_page;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:collection/collection.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/page.dart';
import 'package:diet_driven/pages/page_factory.dart';
import 'package:diet_driven/util/built_firestore.dart';
import 'package:diet_driven/wrappers/drawer_nav_button.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_built_redux/flutter_built_redux.dart';

import 'dart:math';

part 'settings_page.g.dart';

class SettingsPage extends StoreConnector<AppState, Actions, SettingsPageVM> {

  @override
  SettingsPageVM connect(AppState state) {
    return SettingsPageVM((b) => b
      ..userId = state.user.authUser.uid
      ..daysSinceEpoch = state.currentDaysSinceEpoch
      ..date = state.currentDate()
      ..navState = state.navigation.toBuilder()
    );
  }

//  appData.rebuild((b) => b
//  ..data.items[appData.itemIndex] = b.data.items[appData.itemIndex].rebuild((b) => b..text = 'change'))

  @override
  Widget build(BuildContext context, SettingsPageVM vm, Actions actions) {
  // TODO: edit entire navigation state!
  // TODO: bring back reset navigation button
    void onSave(BuiltList<Page> bottomNavigation, Page defaultPage) {
      var temp = FSTuple<NavigationState>(
          NavigationStateDocument((b) => b
            ..userId = vm.userId
          ),
          vm.navState.rebuild((b) => b
            ..bottomNavigation = bottomNavigation
            ..defaultPage = defaultPage
          )
      );
      actions.firestore.updateNavigationState(temp);
    }

    return Scaffold(
      appBar: AppBar(
        leading: GlobalDrawerNavButton(),
        title: Text(PageFactory.toText(Page.settings)),
      ),
      body: BottomNavigationEditor(vm.navState.bottomNavigation, vm.navState.defaultPage, onSave),
//      Column(
//        children: <Widget>[

//          ListTile(
//            leading: Icon(Icons.repeat),
//            title: Text("Randomize bottom menu"),
//            onTap: () {
//              List<Page> randomized = Page.inApp.toList();
//              shuffle(randomized);
//              randomized = randomized.sublist(0, new Random().nextInt(6) + 2);
//              actions.navigation.reorderBottomNavigation(randomized);
//              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Randomized!'), duration: Duration(milliseconds: 500)));
//            },
//            onLongPress: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text('You long pressed!'),)),
//          ),
//          ListTile(
//              leading: const Icon(Icons.undo),
//              title: const Text('Reset bottom navigation settings'),
//              onTap: () {
//                AppState original = new AppState();
//                actions.navigation.reorderBottomNavigation(original.navigation.bottomNavigation.toList()); // FIXME
//                actions.navigation.setDefaultPage(original.navigation.defaultPage);
//              }
//          ),
//          ListTile(
//            leading: Icon(Icons.beach_access),
//            title: Text("Default page"),
//            trailing: DropdownButton<Page>(
//              items: Page.inApp.where((page) => vm.pages.contains(page)).map((page) {
//                return new DropdownMenuItem<Page>(
//                  value: page,
//                  child: new Text(PageFactory.toText(page)),
//                );
//              }).toList(),
//              onChanged: (page) => actions.navigation.setDefaultPage(page),
//              value: vm.defaultPage,
//            ),
//          ),
//        ],
//      ),
//      floatingActionButton: FloatingActionButton.extended(
//        icon: Icon(Icons.save),
//        label: Text("save navigation settings"),
//        onPressed: () {
//
//        }
//      ),
    );
  }
}

abstract class SettingsPageVM implements Built<SettingsPageVM, SettingsPageVMBuilder> {
  String get userId;
  int get daysSinceEpoch;
  DateTime get date;
  NavigationState get navState;
//  BuiltList<Page> get temporaryBottomNavigation;

  SettingsPageVM._();

  factory SettingsPageVM([updates(SettingsPageVMBuilder b)]) =
  _$SettingsPageVM;
}

class BottomNavigationEditor extends StatefulWidget {
  final BuiltList<Page> bottomNavigation;
  final Page defaultPage;
//  final VoidCallback onSave;
  final Function onSave;

  BottomNavigationEditor(this.bottomNavigation, this.defaultPage, this.onSave);

  @override
  _BottomNavigationEditorState createState() => _BottomNavigationEditorState();
}

class _BottomNavigationEditorState extends State<BottomNavigationEditor> {
  BuiltList<Page> bottomNavigation;
  Page defaultPage;


  @override
  void initState() {
    super.initState();
    setState(() {
      bottomNavigation = widget.bottomNavigation;
      defaultPage = widget.defaultPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "minimum 2 maximum 7!!!",
          style: Theme.of(context).textTheme.display1,
        ),
        Text("PREVIEW! (tap to delete)"),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0, // TODO: index of default page!
          items: bottomNavigation.map((page) =>
            BottomNavigationBarItem(
              title: Text(
                PageFactory.toText(page),
                style: TextStyle(
                    fontFamily: "SourceSansPro",
//              fontWeight: FontWeight.w700
                    fontSize: 16
                ),
              ),
              icon: PageFactory.toIcon(page),
            )
          ).toList(),
          onTap: (index) {
            setState(() => bottomNavigation = bottomNavigation.rebuild((b) => b..removeAt(index)));
          },
        ),
        Text("REARRANGE HERE"),
        Container(
          height: 100,
          child: ReorderableListView(
            children: bottomNavigation.map((page) =>
              Icon(
                PageFactory.toIcon(page).icon, // FIXME this is stupid, just hold IconData instead!
                key: Key(page.toString()),
                semanticLabel: page.toString(),
                size: 48,
              )
            ).toList(),
            scrollDirection: Axis.horizontal,
            onReorder: (int from, int to) {
              if (from < to) {
                // removing the item at oldIndex will shorten the list by 1.
                to -= 1;
              }
              var page = bottomNavigation[from];
              setState(() {
                bottomNavigation = bottomNavigation.rebuild((b) => b
                  ..removeAt(from)
                ).rebuild((b) => b
                  ..insert(to, page)
                );
              });
            },
          ),
        ),
        RaisedButton(
          child: Text("SAVE!"),
          onPressed: () => widget.onSave(bottomNavigation, defaultPage),
        ),
        Text("add others here!"),
        Expanded(child: Column(
          children: Page.inApp.where((page) => !bottomNavigation.contains(page)).map((page) =>
            ListTile(
              title: Text(PageFactory.toText(page)),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    bottomNavigation = bottomNavigation.rebuild((b) => b
                      ..add(page)
                    );
                  });
                }
              ),
            )
          ).toList(),
        )),
        Text("DEFAULT PAGE!"),
        DropdownButton<Page>(
          items: bottomNavigation.map((page) {
            return new DropdownMenuItem<Page>(
              value: page,
              child: new Text(PageFactory.toText(page)),
            );
          }).toList(),
          onChanged: (page){
            setState(() {
              defaultPage = page;
            });
          },
          value: defaultPage,
        ),
      ],
    );
  }
}

// TODO: update default page!

//onChanged: (value) {
//print("$page is now $value");
//print(bottomNavigation);
//
//if (value) {
//setState(() => bottomNavigation = bottomNavigation.rebuild((b) => b..add(page)));
//} else {
//setState(() => bottomNavigation = bottomNavigation.rebuild((b) => b..remove(page)));
//}
//},
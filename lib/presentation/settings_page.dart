library settings_page;

import 'package:built_value/built_value.dart';
import 'package:collection/collection.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_built_redux/flutter_built_redux.dart';

import 'dart:math';

part 'settings_page.g.dart';

class SettingsPage extends StatefulWidget {

  @override
  State createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  void initState() {
    super.initState();


//    store.actionStream(ActionsNames.reorderBottomNavigation).listen((change) {
//      if (change.prev.bottomNavigation.contains(Page.settings) && !change.next.bottomNavigation.contains(Page.settings)) {
////        Navigator.pushNamed(context, Page.settings.toString());
////        Navigator.of(navKey.currentContext).pushNamed(Page.settings.toString());
//        print("OUUU LA LA ");
//      }
////      Navigator.pushNamed(context, Page.settings.toString());
//      print('Previous: ${change.prev.bottomNavigation}');
//      print('Next: ${change.next.bottomNavigation}');
//      print('Action: ${change.action.name}');
//    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(PageFactory.toText(Page.settings)),
        ),
        body: new StoreConnection<AppState, Actions, SettingsPageVM>(
            connect: (state) => SettingsPageVM((b) => b
              ..pages = state.bottomNavigation
              ..show = state.showBottomNavigation
            ),
            builder: (BuildContext context, SettingsPageVM vm, Actions actions) {
              return Column(
//                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CheckboxListTile(
                      title: Text("Show bottom navigation"),
                      subtitle: Text(vm.show.toString()),
                      value: vm.show,
                      onChanged: (val) => actions.setShowBottomNavigation(val)
                  ),
                  ListTile( // TODO: disable settings when bottom nav not shown
                    leading: Icon(Icons.repeat),
                    title: Text("Randomize bottom menu"),
                    onTap: () {
                      print(vm.pages);
                      bool containsSettingsBefore = vm.pages.contains(Page.settings);

                      List<Page> randomized = Page.values.toList();
                      shuffle(randomized);
                      randomized = randomized.sublist(0, new Random().nextInt(6) + 2);
                      actions.reorderBottomNavigation(randomized);
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Randomized!'), duration: Duration(milliseconds: 500)));

                      print(randomized);
                      bool containsSettingsAfter = randomized.contains(Page.settings);

                      print("$containsSettingsBefore $containsSettingsAfter");
                      if (containsSettingsBefore != containsSettingsAfter) {
                        if (Navigator.canPop(context)) {
                          // Open settings in bottom navigation
                          Navigator.pop(context);
                          actions.updateTab(Page.settings); // incase never exited settings nested page
                        } else {
                          // Open settings in nested page
                          Navigator.pushNamed(context, Page.settings.toString());
                          actions.updateTab(randomized[0]);
                        }
                      }
                    },
                    onLongPress: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text('You long pressed!'),)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.undo),
                    title: const Text('Reset bottom navigation settings'),
                    onTap: actions.resetBottomNavigation,
                  ),
                ],
              );
            })
        );
  }

}

abstract class SettingsPageVM
    implements Built<SettingsPageVM, SettingsPageVMBuilder> {
  List<Page> get pages;

  bool get show;

  SettingsPageVM._();

  factory SettingsPageVM([updates(SettingsPageVMBuilder b)]) =
  _$SettingsPageVM;
}

// TODO: test that settings thing, see that it goes to 0 (current index)
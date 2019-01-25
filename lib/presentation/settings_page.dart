library settings_page;

import 'package:built_value/built_value.dart';
import 'package:collection/collection.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_built_redux/flutter_built_redux.dart';

import 'dart:math';

part 'settings_page.g.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: DrawerNavButton(),
          title: Text(PageFactory.toText(Page.settings)),
        ),
        body: new StoreConnection<AppState, Actions, SettingsPageVM>(
            connect: (state) => SettingsPageVM((b) => b
              ..pages = state.bottomNavigation
              ..defaultPage = state.defaultPage
            ),
            builder: (BuildContext context, SettingsPageVM vm, Actions actions) {
              return Column(
//                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.repeat),
                    title: Text("Randomize bottom menu"),
                    onTap: () {
                      List<Page> randomized = Page.inApp.toList();
                      shuffle(randomized);
                      randomized = randomized.sublist(0, new Random().nextInt(6) + 2);
                      actions.reorderBottomNavigation(randomized);
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Randomized!'), duration: Duration(milliseconds: 500)));
                    },
                    onLongPress: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text('You long pressed!'),)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.undo),
                    title: const Text('Reset bottom navigation settings'),
                    onTap: () {
                      AppState original = new AppState();
                      actions.reorderBottomNavigation(original.bottomNavigation);
                      actions.setDefaultPage(original.defaultPage);
                    }
                  ),
                  ListTile(
                    leading: Icon(Icons.beach_access),
                    title: Text("Default page"),
                    trailing: DropdownButton<Page>(
                      items: Page.inApp.where((page) => vm.pages.contains(page)).map((page) {
                        return new DropdownMenuItem<Page>(
                          value: page,
                          child: new Text(PageFactory.toText(page)),
                        );
                      }).toList(),
                      onChanged: (page) => actions.setDefaultPage(page),
                      value: vm.defaultPage,
                    ),
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
  Page get defaultPage;

  SettingsPageVM._();

  factory SettingsPageVM([updates(SettingsPageVMBuilder b)]) =
  _$SettingsPageVM;
}
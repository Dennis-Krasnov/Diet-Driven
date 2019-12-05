/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

/// Custom bottom navigation.
class BottomNavigation extends StatelessWidget {
  final DeepLinkNavigator deepLinkNavigator;
  final BuiltList<DeepLink> bottomNavigationPages;

  const BottomNavigation({Key key, this.deepLinkNavigator, this.bottomNavigationPages}) : super(key: key);

  /// Current index of bottom navigation based on [currentRoute].
  int currentIndex(List<DeepLink> currentRoute) {
    print(currentRoute);
    final index = bottomNavigationPages.indexWhere((DeepLink dl) => dl.runtimeType == currentRoute?.first?.runtimeType);
    return index != -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        for(var deepLink in bottomNavigationPages)
          BottomNavigationBarItem(
            title: Text(deepLink.runtimeType.toString()),
            icon: BottomNavigationIcon(Icons.favorite),
            activeIcon: BottomNavigationIcon(Icons.favorite),
          ),
      ],
      currentIndex: currentIndex(deepLinkNavigator.currentRoute),
      onTap: (index) => deepLinkNavigator.navigateTo([bottomNavigationPages[index]]),
      elevation: 4,
      iconSize: 24,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      selectedFontSize: 15,
      unselectedFontSize: 14,
    );
  }
}

/// Custom bottom navigation button.
/// TODO: function widgets
class BottomNavigationIcon extends StatelessWidget {
  final IconData iconData;

  const BottomNavigationIcon(this.iconData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Icon(iconData),
  );
}
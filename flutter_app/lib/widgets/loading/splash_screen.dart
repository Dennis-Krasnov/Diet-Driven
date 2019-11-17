/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter/material.dart';

import 'package:diet_driven/widgets/loading/loading.dart';

// TODO: separate into multiple widgets (one for each field of scaffold)
class SplashPage extends StatelessWidget {
  final int bottomNavPages;

  const SplashPage({Key key, this.bottomNavPages = 4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ShimmerRectangle(width: 160, height: 22),
        actions: const <Widget>[
          IconButton(icon: ShimmerCircle(radius: 28), onPressed: null),
          IconButton(icon: ShimmerCircle(radius: 28), onPressed: null),
        ],
      ),
      floatingActionButton: const ShimmerCircle(radius: 56),
      // Disable BottomNavigationBarItem's ink wells
      bottomNavigationBar: IgnorePointer(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            for (var _ in List.generate(bottomNavPages, (_) => null))
              const BottomNavigationBarItem(
                title: ShimmerRectangle(width: 48, height: 12),
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: ShimmerRectangle(width: 24, height: 24),
                ),
              )
          ],
          currentIndex: 0,
          elevation: 4,
          selectedFontSize: 14,
          unselectedFontSize: 14,
        ),
      ),
    );
  }
}



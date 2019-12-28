/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';

/// Shows generic header.
class Header extends StatelessWidget {
  /// ...
  static double height = 30;

  /// Text of this header.
  final String text;

  /// Widgets to place at the end of the header.
  final List<Widget> trailingWidgets;

  /// Called when the user taps this header.
  final GestureTapCallback onTap;

  /// Called when the user long-presses on this header.
  final GestureLongPressCallback onLongPress;

  const Header({Key key, this.text, this.trailingWidgets, this.onTap, this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      // Opaque header container
      child: Container(
        height: height,
        padding: const EdgeInsets.only(left: 16, right: 16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(0, 0, 0, 0.08),
          )),
        ),
        child: Row(
          // Align text to single baseline
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            // Header takes as much space as possible
            Expanded(
              child: Text(
                text.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: const Color.fromRGBO(0, 0, 0, 0.6),
                ),
              ),
            ),
            ...trailingWidgets,
          ],
        ),
      ),
    );
  }
}
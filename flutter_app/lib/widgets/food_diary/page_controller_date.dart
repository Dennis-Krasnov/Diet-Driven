/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';

/// Higher order component extracts current date from page controller.
class PageControllerDate extends StatefulWidget {
  /// Need to default to [currentDate] to [initialPage] so that first builder call doesn't pass along null;
  final int initialPage;

  final PageController pageController;

  final Widget Function(BuildContext context, int date) builder;

  const PageControllerDate({@required this.initialPage, this.pageController, @required this.builder});

  @override
  _PageControllerDateState createState() => _PageControllerDateState();
}

class _PageControllerDateState extends State<PageControllerDate> {
  /// Current date of page controller.
  int currentDate;

  /// Function to execute on page controller update.
  VoidCallback onPageController;

  @override
  void initState() {
    super.initState();

    // Update function
    onPageController = () => setState(() {
      // FIXME: proving today as default value is easiest solution to avoid starting current date as null,
      currentDate = widget?.pageController?.page?.round() ?? widget.initialPage;
    });

    // Starting value
    onPageController();

    widget.pageController.addListener(onPageController);
  }

  @override
  void dispose() {
    super.dispose();
    widget.pageController.removeListener(onPageController);
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, currentDate);
}
import 'package:flutter/material.dart';

/// Higher order component extracts current date from page controller.
class PageControllerDate extends StatefulWidget {
  final PageController pageController;

  final Widget Function(BuildContext context, int date) builder;

  const PageControllerDate({@required this.pageController, @required this.builder});

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
      currentDate = widget.pageController.page.round();
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
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:flutter/material.dart';

/// Higher order component extracts bottomNavigationPage from state
/*
  @override
  Widget build(BuildContext context) =>
    BottomNavPage(builder: (BuildContext context, Page bottomNavPage) {
       return Text(PageFactory.toText(bottomNavPage));
    });
 */
class BottomNavPage extends StoreConnector<AppState, Actions, Page> {
  final Widget Function(BuildContext context, Page activePage) builder;

  BottomNavPage({Key key, @required this.builder}) : super(key: key);

  @override
  Page connect(AppState state) => state.navigation.bottomNavigationPage;

  @override
  Widget build(BuildContext context, Page bottomNavigationPage, Actions actions) {
    return builder(context, bottomNavigationPage);
  }
}

import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:flutter/material.dart';


class ActivePage extends StoreConnector<AppState, Actions, Page> {
  final Widget Function(BuildContext context, Page activePage) builder;

  ActivePage({Key key, @required this.builder}) : super(key: key);

  @override
  Page connect(AppState state) => state.activePage;

  @override
  Widget build(BuildContext context, Page activePage, Actions actions) {
    return builder(context, activePage);
  }
}

/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.value = TextEditingValue(
      text: BlocProvider.of<FoodSearchBloc>(context).initialQuery,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    final searchBloc = BlocProvider.of<FoodSearchBloc>(context);
    return BlocBuilder<FoodSearchBloc, FoodSearchState>(
      builder: (BuildContext context, FoodSearchState state) {
        return Scaffold(
          appBar: FoodDiaryAppBar(controller: _controller),
          body: Center(
//            child: Text("Initial query is ${BlocProvider.of<FoodSearchBloc>(context).initialQuery}, state is $state"),
            child: RaisedButton(
              child: const Text("return a random thing"),
              onPressed: () => DeepLinkNavigator.of(context).pop<FoodRecord>(FoodRecord.random()),
            ),
          ),
        );
      },
    );
  }
}


// TODO: reuse diary app bar styling
// TODO: custom scroll view, single sticky header
// or multiple, depending on the category...

/// ...
/// Scaffold's appBar field requires a PreferredSizeWidget.
class FoodDiaryAppBar extends PreferredSize {
  final int initialDate;
  final TextEditingController controller;

  static const height = Size.fromHeight(kToolbarHeight);

  const FoodDiaryAppBar({Key key, this.initialDate, this.controller}) : super(
    key: key,
    preferredSize: height,
    child: null,
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//AppBar(
//            title: TextField(
//              controller: _controller,
//              enabled: state is! FoodSearchLoaded || !(state as FoodSearchLoaded).loading,
//              onEditingComplete: () => searchBloc.add(SearchFoods()),
//              onChanged: (text) => searchBloc.add(UpdateQuery((b) => b
//                ..query = text
//              )),
//              decoration: InputDecoration(
//                border: InputBorder.none,
//                hintText: "Search foods...",
//                filled: true,
//                suffixIcon: state.query == ""
//                  // TODO: optimize this
//                  ? IconButton(
//                    icon: Icon(
//                      Icons.mic,
//                      color: Colors.black,
//                    ),
//                    // FIXME: still stays as microphone!
//                    onPressed: () => _controller.value = _controller.value.copyWith(
//                      text: "OPPA",
//                      selection: const TextSelection(baseOffset: "OPPA".length, extentOffset: "OPPA".length),
//                      composing: TextRange.empty,
//                    ),
//                  )
//                  : IconButton(
//                    icon: Icon(
//                      Icons.search,
//                      color: Colors.black,
//                    ),
//                    onPressed: () => searchBloc.add(SearchFoods()),
//                  ),
//              ),
//            ),
//          )
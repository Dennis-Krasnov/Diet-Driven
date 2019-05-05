import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/food_record_tile.dart';

/// Inspired by Flutter's built-in [SearchDelegate].
///
/// Shows a full screen search page and returns the search result selected by
/// the user when the page is closed directly using Flutter's [Navigator].
///
/// The search page consists of an app bar with a search field and a body which
/// can either show suggested search queries, a loading screen, or the search results.

class FoodRecordSearch extends StatefulWidget {
  final FoodLoggingState foodLoggingState;

  const FoodRecordSearch({Key key, @required this.foodLoggingState})
    : assert(foodLoggingState != null), super(key: key);

  @override
  _FoodRecordSearchState createState() => _FoodRecordSearchState();
}

class _FoodRecordSearchState extends State<FoodRecordSearch> {
  FoodSearchBloc _foodSearchBloc;

  /// Stores and manages current query text.
  /// Intentionally avoiding storing query in bloc to avoid race conditions and side effects.
  TextEditingController queryTextController;

  /// Query is focused only when in query mode, auto-focused.
  FocusNode queryFocusNode;

  @override
  void initState() {
    super.initState();

    _foodSearchBloc = FoodSearchBloc(
      foodLoggingState: widget.foodLoggingState,
      foodRepository: Repository().food,
    );

    queryTextController = TextEditingController();

    queryFocusNode = FocusNode(); // ..requestFocus(); FIXME DOESN'T WORK !?!?
  }

  @override
  void dispose() {
    _foodSearchBloc?.dispose();
    queryTextController?.dispose();
    queryFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodSearchEvent, FoodSearchState>(
      bloc: _foodSearchBloc,
      builder: (BuildContext context, FoodSearchState state) {
        Widget body;

        if (state is FoodSearchQuery) {
          body = ListView(
            children: [
              for (String suggestion in state.suggestions)
                ListTile(
                  title: Text(suggestion),
                  // TODO: actions
                )
            ],
          );
        }

        if (state is FoodSearchFailed) {
          body = Column(children: <Widget>[
            Text("AN ERROR OCCURED"),
            Text(state.error),
            Divider(),
            Text(state.error),
          ]);
        }

        if (state is FoodSearchLoading) {
          body = Center(child: CircularProgressIndicator());
        }

        if (state is FoodSearchLoaded) {
          body = ListView(
            children: state.results.map((foodRecordResult) =>
              FoodRecordTile(
                foodRecordResult.foodRecord,
                onTap: () async {
                  FoodRecord modified = await Navigator.of(context).pushNamed<FoodRecord>(
                    "/logging_food_record_edit",
                    arguments: foodRecordResult.foodRecord
                  );

                  // Adds modified result to diary
                  if (modified != null) {
                    assert(Navigator.of(context).canPop());
                    Navigator.of(context).pop<FoodRecord>(modified);
                  }
                }
              )
            ).toList(),
          );
        }

        assert(body != null);

        // TODO: make a function out of this to reduce indentation
        return Semantics(
          explicitChildNodes: true,
          scopesRoute: true,
          namesRoute: true,
          label: routeName(context),
          child: Scaffold(
            appBar: AppBar(
//              backgroundColor: theme.primaryColor,
//              iconTheme: theme.primaryIconTheme,
//              textTheme: theme.primaryTextTheme,
//              brightness: theme.primaryColorBrightness,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop<FoodRecord>(null);
                },
              ),

              title: TextField(
                controller: queryTextController,
                focusNode: queryFocusNode,
                style: Theme.of(context).textTheme.title,
                autofocus: true,
                autocorrect: false,
                enabled: !(state is FoodSearchLoading || state is FoodSearchFailed),
                textInputAction: TextInputAction.search,
                // Enters query mode
                onTap: () => _updateQuery(queryTextController.text),
                // Called initially with previous controller instance's value then empty (possibly a hot restart error)
                // Also called on loss of focus with latest value
                onChanged: (text) {
                  // OPTIMIZE: take distinct events in bloc!!!
                  _foodSearchBloc.dispatch(UpdateQuery((b) => b
                    ..query = text
                  ));
                },
                  // TODO: use TextInputFormatter for this and number field selection
                onSubmitted: (text) {
                  if (text.isNotEmpty) {
                    _searchQuery(text);
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
//                    hintText: searchFieldLabel,
                ),
              ),
              actions: [
                if (state is FoodSearchQuery && state.query.isEmpty) // FIXME: not updated anymore, need to put query back into bloc!
                  IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () async {
                      String microphoneQuery = await Future.value("Pressed microphone"); // TODO

                      if (microphoneQuery != null && microphoneQuery.isNotEmpty) {
                        // Update search field
                        _updateQuery(microphoneQuery);

                        // Automatically run search
                        _searchQuery(microphoneQuery);
                      }
                    },
                  ),
                if (state is FoodSearchLoaded || (state is FoodSearchQuery && state.query.isNotEmpty))
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _updateQuery("")
                  ),
              ],
            ),
            body: body
            // TODO: use animation switchers in other places as well
//              body: AnimatedSwitcher( // TODO: requires unique keys!
//                duration: const Duration(milliseconds: 300),
//                child: body,
//              ),
          ),
        );
      }
    );
  }

  ///
  void _updateQuery(String text) {
    _foodSearchBloc.dispatch(UpdateQuery((b) => b..query = text));

    queryTextController.value = TextEditingValue(
      text: text,
      selection: TextSelection(baseOffset: 0, extentOffset: text.length)
    );

    // OPTIMIZE: might not be required if settings selection
    if (!queryFocusNode.hasPrimaryFocus) {
      queryFocusNode.requestFocus();
    }
  }

  ///
  void _searchQuery(String text) {
    _foodSearchBloc.dispatch(SearchFoods((b) => b..query = text));
    queryFocusNode.unfocus();
  }

  /// Taken from Flutter's [_SearchPage] widget
  String routeName(BuildContext context) {
    String routeName;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        routeName = '';
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        routeName = MaterialLocalizations.of(context).searchFieldLabel;
    }
    return routeName;
  }
}





//https://medium.com/flutterpub/implementing-search-in-flutter-17dc5aa72018

//class FoodRecordSearchDelegate extends SearchDelegate<FoodRecord> {
//  final FoodLoggingBloc foodLoggingBloc; // TODO: use provider instead!!!
//  // TODO: colour already logged & selected similar to logging
//
//  FoodRecordSearchDelegate({@required this.foodLoggingBloc, @required this.foodSearchBloc})
//    : assert(foodLoggingBloc != null),
//      assert(foodSearchBloc != null);
//
//  @override
//  ThemeData appBarTheme(BuildContext context) => Theme.of(context);
//
//  // TODO: bloc listener
//
//
//
//  /// Uses built-in query field instead of bloc state for simplicity.
//  @override
//  List<Widget> buildActions(BuildContext context) {
//    return ;
//  }
//
//  /// Uses built-in query field instead of bloc state for simplicity.
//  @override
//  Widget buildLeading(BuildContext context) {
//    return ;
//  }
//
//  @override
//  Widget buildResults(BuildContext context) {
//    // Update bloc query whenever query fields updates
//    foodSearchBloc.dispatch(UpdateQuery((b) => b..query = query));
//
//    return BlocBuilder<FoodSearchEvent, FoodSearchState>(
//      bloc: foodSearchBloc,
//      builder: (BuildContext context, FoodSearchState state) {
//        return ListView(
//          children: <Widget>[
//            for (var foodRecordResult in state.results)
//              FoodRecordTile(
//                foodRecordResult.foodRecord,
//                onTap: () async {
//                  FoodRecord modified = await Navigator.of(context).pushNamed<FoodRecord>(
//                    "/logging_food_record_edit",
//                    arguments: foodRecordResult.foodRecord
//                  );
//
//                  // Adds modified result to diary
//                  if (modified != null) {
//                    close(context, modified);
//                  }
//                },
//              )
//          ]
//        );
//      }
//    );
//  }
//
//  @override
//  Widget buildSuggestions(BuildContext context) {
//    // TODO: bloc builder
//    return Column();
//  }
//
//}
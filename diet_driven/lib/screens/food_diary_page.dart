import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repository_singleton.dart';
import 'package:diet_driven/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDiaryPage extends StatefulWidget {
  @override
  _FoodDiaryPageState createState() => _FoodDiaryPageState();
}

class _FoodDiaryPageState extends State<FoodDiaryPage> {
  final controller = PageController(initialPage: 124);
  int page = 124;

  @override
  Widget build(BuildContext context) {
    final userId = (BlocProvider.of<UserDataBloc>(context).currentState as UserDataLoaded).authentication.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Diary"),
        actions: <Widget>[
          Text("page ???", style: TextStyle(color: Colors.black),),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => null, //controller.animateToPage(124, duration: const Duration(seconds: 1), curve: const ElasticInCurve())
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
              ..deepLink = DiarySettingsDeepLink()
            )),
          ),
        ],
      ),
      body: PageView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int position) {
          return BlocProvider<FoodDiaryBloc>(
            key: ValueKey(position),
            builder: (BuildContext context) => FoodDiaryBloc(
              daysSinceEpoch: position,
              diaryRepository: Repository().diary,
              userId: userId
            ),
            dispose: null, // (BuildContext context, FoodDiaryBloc foodDiaryBloc) => foodDiaryBloc.dispose(),
            child: FoodDiaryDay(),
          );
        },
        // TODO: call generic DaySwitcherBloc with debounce!
        onPageChanged: (int date) => setState(() {
          page = date;
        }),
      ),
    );
  }
}


class FoodDiaryDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _foodDiaryBloc = BlocProvider.of<FoodDiaryBloc>(context);

    return BlocBuilder<FoodDiaryEvent, FoodDiaryState>(
      bloc: _foodDiaryBloc,
      builder: (BuildContext context, FoodDiaryState state) {
        //
        if (state is FoodDiaryUninitialized) {
          return const FlutterLogo(); // TODO: skeleton pages
        }

        //
        if (state is FoodDiaryFailed) {
          return ErrorPage(error: "Invalid food diary state: $state} - ${state.error}");
        }

        // Start application when user is loaded
        if (state is FoodDiaryLoaded) {
          return CustomScrollView(
            slivers: <Widget>[
//              SliverAppBar(
//                title: const Text("Diary"),
//                actions: <Widget>[
//                  Text("page ${state.foodDiaryDay.date.toString()}", style: TextStyle(color: Colors.black),),
//                  IconButton(
//                      icon: const Icon(Icons.calendar_today),
//                      onPressed: () => null, //controller.animateToPage(124, duration: const Duration(seconds: 1), curve: const ElasticInCurve())
//                  ),
//                  IconButton(
//                    icon: const Icon(Icons.settings),
//                    onPressed: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
//                      ..deepLink = DiarySettingsDeepLink()
//                    )),
//                  ),
//                ],
//                backgroundColor: Colors.white,
//                expandedHeight: 150,
//                floating: true,
//                pinned: true,
//                snap: true,
//                flexibleSpace: FlexibleSpaceBar(
//                  background: const FlutterLogo(), //Image.asset('assets/forest.jpg', fit: BoxFit.cover),
//                ),
//              ),
              SliverFixedExtentList(
                itemExtent: 150.0,
                delegate: SliverChildListDelegate(
                  [
                    Container(color: Colors.red),
                    Container(color: Colors.purple),
                    Container(color: Colors.green),
                    Container(color: Colors.orange),
                    Container(color: Colors.yellow),
                    Container(color: Colors.pink),
                  ],
                ),
              ),
            ],
          );
          /*
          return CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              SliverAppBar(
                title: const Text('SliverAppBar'),
                backgroundColor: Colors.green,
                expandedHeight: 200.0,
                snap: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: FlutterLogo(),
                ),
              ),
//              SliverAppBar(
////                title: const Text("Diary"),
////                backgroundColor: Colors.green,
////                elevation: 1.5,
//////                forceElevated: true,
////                expandedHeight: 100.0,
//////                floating: false,
////                pinned: true,
//
//                pinned: true,
//                expandedHeight: 250.0,
//                flexibleSpace: FlexibleSpaceBar(
//                  title: const Text("Demo",
//                      style: TextStyle(
//                        fontSize: 10.0,
//                        fontWeight: FontWeight.w900,
//                        color: Colors.green,
//                      )),
//                  background: const FlutterLogo(
//                    size: 20.0,
//                    colors: Colors.blue,
//                  ),
//                ),
//                backgroundColor: Colors.orange,
//              ),
//              SliverPadding(
//                padding: const EdgeInsets.all(20.0),
//                sliver:
                SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: Colors.red, height: 150.0),
                    );
                  },
                  childCount: 5
                  ),
//                  SliverChildListDelegate(
//                    <Widget>[
//                      for (var i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13])
//                        ListTile(title: Text(i.toString()))
//                    ],
//                  ),
                ),
//              ),
            ],


          );
          */
        }

        return ErrorPage(error: "Invalid food diary state: $state}");
      }
    );
  }
}

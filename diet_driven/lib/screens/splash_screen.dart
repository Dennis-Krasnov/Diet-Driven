import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shimmer/shimmer.dart';

import 'package:diet_driven/blocs/blocs.dart';

class SplashPage extends StatelessWidget {
  final int bottomNavPages = 4;

  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    final ConfigurationBloc _configurationBloc = BlocProvider.of<ConfigurationBloc>(context);

    return StreamBuilder<int>(
//      stream: RepeatStream((iteration) => Observable<int>.periodic(Duration(milliseconds: 500), (i) => i).take(bottomNavPages), 9999),
      stream: Observable<int>.periodic(Duration(milliseconds: 500), (i) => i),
        builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const ShimmerRectangle(width: 160, height: 22),
            actions: const <Widget>[
              IconButton(icon: ShimmerCircle(radius: 28), onPressed: null),
              IconButton(icon: ShimmerCircle(radius: 28), onPressed: null),
            ],
          ),
          body: snapshot.hasData ? SafeArea( // TODO:
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (snapshot.data > 5 * 2)
                    const Text('This is taking longer than usual...'),
                  if (snapshot.data > 10 * 2)
                    const Text('check your internet connection...'),
                  Text('User data ${_userDataBloc.currentState?.runtimeType ?? "is loading"}'),
                  Text('Configuration: ${_configurationBloc.currentState?.runtimeType ?? "is loading"}'),
                ],
              )
            ),
          ) : null,
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
              // currentIndex makes respective title slightly bigger for shifting animation
              currentIndex: snapshot.hasData ? snapshot.data % bottomNavPages : 0,
              elevation: 4,
            ),
          ),
        );
      }
    );
  }
}

class ShimmerRectangle extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerRectangle({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
      ),
      baseColor: Colors.grey[200],
      highlightColor: Colors.grey[100],
    );
  }
}

class ShimmerCircle extends StatelessWidget {
  final double radius;

  const ShimmerCircle({Key key, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: radius,
        height: radius,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      baseColor: Colors.grey[200],
      highlightColor: Colors.grey[100],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:diet_driven/screens/penguin_animation.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(),
            // FIXME
//            child: SizedBox(child: PenguinAnimation(), height: 200, width: 200,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "loading...",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],
        fit: StackFit.expand,
      )
    );
  }
}

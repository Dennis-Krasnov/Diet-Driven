/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

//import 'package:flare_dart/math/mat2d.dart';
//import 'package:flare_flutter/flare_controller.dart';
//import 'package:flare_flutter/flare.dart';
//import 'package:flare_flutter/flare_actor.dart';
//import 'package:flutter/material.dart';
//
//class PenguinAnimation extends StatefulWidget {
//  PenguinAnimation({Key key}) : super(key: key);
//
//  @override
//  _PenguinAnimationState createState() => new _PenguinAnimationState();
//}
//
//class _PenguinAnimationState extends State<PenguinAnimation> implements FlareController {
//  double _rockAmount = 0.5;
//  double _speed = 1.0;
//  double _rockTime = 0.0;
//  bool _isPaused = false;
//
//  ActorAnimation _rock;
//
//  @override
//  void initialize(FlutterActorArtboard artboard) {
////    _rock = artboard.getAnimation("music_walk");
//    _rock = artboard.getAnimation("load");
//  }
//
//  @override
//  void setViewTransform(Mat2D viewTransform) {}
//
//  @override
//  bool advance(FlutterActorArtboard artboard, double elapsed) {
//    _rockTime += elapsed * _speed;
//    _rock.apply(_rockTime % _rock.duration, artboard, _rockAmount);
//    return true;
//  }
//
//  @override
//  Widget build(BuildContext context) {
////    return FlareActor("assets/Penguin.flr",
//    return FlareActor("assets/Load.flr", // https://www.2dimensions.com/a/baradghimire/files/flare/outcome.loading/preview
//      alignment: Alignment.center,
//      isPaused: _isPaused,
//      fit: BoxFit.cover,
////      animation: "walk",
//      animation: "load",
//      controller: this
//    );
//  }
//}
//
////Positioned.fill(
////            child: new Column(
////              mainAxisAlignment: MainAxisAlignment.end,
////              children: <Widget>[
////                Container(
////                  height: 200,
////                  color: Colors.black.withOpacity(0.5),
////                  child: new Column(
////                    crossAxisAlignment: CrossAxisAlignment.start,
////                    children: <Widget>[
////                      new Text("Mix Amount", style: TextStyle(color: Colors.white)),
////                      new Slider(
////                        value: _rockAmount,
////                        min: 0.0,
////                        max: 1.0,
////                        divisions: null,
////                        onChanged: (double value) {
////                          setState(() {
////                            _rockAmount = value;
////                          });
////                        },
////                      ),
////                      new Text("Speed", style: TextStyle(color: Colors.white)),
////                      new Slider(
////                        value: _speed,
////                        min: 0.2,
////                        max: 3.0,
////                        divisions: null,
////                        onChanged: (double value) {
////                          setState(() {
////                            _speed = value;
////                          });
////                        },
////                      ),
////                      new Text("Paused", style: TextStyle(color: Colors.white)),
////                      new Checkbox(
////                        value: _isPaused,
////                        onChanged: (bool value) {
////                          setState(() {
////                            _isPaused = value;
////                          });
////                        },
////                      )
////                    ],
////                  )
////                ),
////             ]
////            )
////          )

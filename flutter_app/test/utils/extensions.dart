/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:time/time.dart';

extension WhenExtension on PostExpectation {
  void future<T>(T answer) => thenAnswer((_) async => answer);

  /// ...
  /// when(userRepository.userDocument$(any)).thenAnswer((_) async* {
  ///   yield userDocument;
  /// });
  void stream<T>(Iterable<T> answer) => thenAnswer((_) => Stream<T>.fromIterable(answer));

  /// ...
  /// when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromIterable([null, user]).asBroadcastStream());
  void broadcastStream<T>(Iterable<T> answer) => thenAnswer((_) => Stream<T>.fromIterable(answer).asBroadcastStream());

//  //  when(userRepository.authStateChanged$()).thenAnswer((_) => Stream.fromFutures(<Future<Authentication>>[
////  Future.value(),
////  Future.value(userA),
////  Future.delayed(ticks(5)),
////  ]).asBroadcastStream());
  void streamFutures<T>(Iterable<Future<T>> futures) => thenAnswer((_) => Stream<T>.fromFutures(futures));

  // Must specify type of iterable
  void broadcastStreamFutures<T>(Iterable<Future<T>> futures) => thenAnswer((_) => Stream<T>.fromFutures(futures).asBroadcastStream());
}

extension BlocTestExtensions on Bloc {
  Future<void> expectEmits<T>(Iterable<T> matchers) => expectLater(this, emitsInOrder(matchers));

  void whenListenStream<S>(Iterable<S> answer) => whenListen<dynamic, S>(this, Stream<S>.fromIterable(answer));

  void whenListenStreamFutures<S>(Iterable<Future<S>> futures) => whenListen<dynamic, S>(this, Stream<S>.fromFutures(futures));
}

extension TestIntegerExtensions on int {
  // 1.tick
  Duration get tick => milliseconds * 20;
  Duration get ticks => tick;
}

extension TestDurationExtensions on Duration {
  // await 2.ticks.delay;
  Future<void> get delay => Future.delayed(this);

  // 3.ticks.value(...);
  Future<T> value<T>(T value) => Future.delayed(this, () => value);
}
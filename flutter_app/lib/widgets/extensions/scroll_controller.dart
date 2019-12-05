/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:time/time.dart';

// TODO: use scroll positions?

extension ScrollControllerExtensions on ScrollController {
  /// Quickly corrects scroll position by [delta] pixels after a short delay.
  Future<void> snapBy(double delta) async {
    // Execute after [NotificationListener] processes [ScrollNotification]
    await Future<void>.delayed(10.milliseconds);

    // ...
    animateTo(offset + delta, duration: 200.milliseconds, curve: Curves.ease); // TODO: vary duration based on delta (constant factor)

//     Trigger lower sticky header's [isPinned] by overshooting its scroll position
//     Relapse scroll to header's true scroll position while continuing animation
//    // TODO: ensure `FoodDiaryDayPage.isScrolling = false;` doesn't during disjoint transition (do some math)
//    animateTo(targetPixels, duration: 50.milliseconds, curve: Curves.easeOutBack); // TODO: vary duration based on delta (constant factor)
  }
}
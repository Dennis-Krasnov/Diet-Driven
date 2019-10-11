/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Home Screen Test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver?.close();
    });

    test('verify the text on home screen', () async {
//      await driver.tap(buttonFinder);
      final btn = find.byValueKey("cridentials_button");
      await driver.waitFor(btn);
      expect(await driver.getText(btn), "Enter Dennis' cridentials");
    });
  });
}

// Record a performance timeline as the app scrolls through the list of items.
//final timeline = await driver.traceAction(() async {
//  await driver.scrollUntilVisible(
//    listFinder,
//    itemFinder,
//    dyScroll: -300.0,
//  );
//
//  expect(await driver.getText(itemFinder), 'Item 50');
//});

//// Convert the Timeline into a TimelineSummary that's easier to read and
//// understand.
//final summary = new TimelineSummary.summarize(timeline);
//
//// Then, save the summary to disk.
//summary.writeSummaryToFile('scrolling_summary', pretty: true);
//
//// Optionally, write the entire timeline to disk in a json format. This
//// file can be opened in the Chrome browser's tracing tools found by
//// navigating to chrome://tracing.
//summary.writeTimelineToFile('scrolling_timeline', pretty: true);



//scrolling_summary.timeline_summary.json contains the summary. Open Open the file with any text editor to review the information contained within. With a more advanced setup, you could save a summary every time the test runs and create a graph of the results.
//scrolling_timeline.timeline.json contains the complete timeline data. Open the file using the Chrome browser’s tracing tools found at chrome://tracing. The tracing tools provide a convenient interface for inspecting the timeline data to discover the source of a performance issue.

//http://cogitas.net/write-integration-test-flutter/
//https://github.com/flutter/flutter/issues/27826


// GHERKIN

// https://medium.com/flutter-community/automated-testing-using-atdd-in-flutter-21d4d0cf5df6
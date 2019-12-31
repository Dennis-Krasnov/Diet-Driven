/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc_logging/bloc_logging.dart';
import 'package:flutter/material.dart';

// TODO: confirmation page, if confirms, calls passed action

Completer<void> infoSnackBarCompleter(BuildContext context, String successMessage,) {
  assert(context != null);
  assert(successMessage != null && successMessage.isNotEmpty);

  final Completer<void> completer = Completer<void>();

  completer.future.then((_) {
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(successMessage)
    ));
  })
  .catchError((Object error) {
    BlocLogger().unexpectedError("info snack bar failed", error);
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(error.toString())
    ));
  });

  return completer;
}

Completer<void> undoSnackBarCompleter(BuildContext context, String successMessage, {VoidCallback onUndo}) {
  assert(context != null);
  assert(successMessage != null && successMessage.isNotEmpty);

  final Completer<void> completer = Completer<void>();

  completer.future.then((_) {
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      //key: ArchSampleKeys.snackbar,
      duration: Duration(seconds: 2),
      content: Text(
        successMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: Theme
        .of(context)
        .backgroundColor,
      action: SnackBarAction(
//      label: ArchSampleLocalizations.of(context).undo, // TODO
        label: "undo",
        onPressed: onUndo,
      )
    ));
  })
  .catchError((Object error) {
    BlocLogger().unexpectedError("undo snack bar failed", error);
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(error.toString())
    ));
  });

  return completer;
}

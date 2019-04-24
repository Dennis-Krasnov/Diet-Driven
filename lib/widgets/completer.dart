import 'dart:async';

import 'package:flutter/material.dart';

//    Scaffold.of(context).hideCurrentSnackBar();

// TODO: confirmation page, if confirms, calls passed action

Completer<void> infoSnackBarCompleter(BuildContext context, String successMessage, {bool shouldPop = false}) {
  final Completer<void> completer = Completer<void>();

  completer.future.then((_) {
    if (shouldPop) {
      Navigator.of(context).pop();
    }

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(successMessage)
    ));
  })
  .catchError((Object error) {
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(error.toString())
    ));
  });

  return completer;
}

Completer<void> undoSnackBarCompleter(BuildContext context, String successMessage,
    {VoidCallback onUndo, bool shouldPop = false}) {
  final Completer<void> completer = Completer<void>();

  completer.future.then((_) {
    if (shouldPop) {
      Navigator.of(context).pop();
    }

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
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(error.toString())
    ));
  });

  return completer;
}

import 'dart:async';

import 'package:built_value/built_value.dart';

// TODO: implements instead of with !? => do uninstantiable thing!
abstract class Completable {
  @nullable
  Completer<void> get completer;
}

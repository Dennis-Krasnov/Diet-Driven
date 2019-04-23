import 'dart:async';

import 'package:built_value/built_value.dart';

abstract class Completable {
  @nullable
  Completer<void> get completer;
}

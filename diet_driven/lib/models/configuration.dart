/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

part 'configuration.g.dart';

/// Remote config
abstract class RemoteConfiguration implements Built<RemoteConfiguration, RemoteConfigurationBuilder> {
  bool get liveConfiguration;
  int get bonus;

  factory RemoteConfiguration([void Function(RemoteConfigurationBuilder b)]) = _$RemoteConfiguration;
  RemoteConfiguration._();
}

/// Default values
abstract class RemoteConfigurationBuilder implements Builder<RemoteConfiguration, RemoteConfigurationBuilder> {
  bool liveConfiguration = false;
  int bonus = 0;

  factory RemoteConfigurationBuilder() = _$RemoteConfigurationBuilder;
  RemoteConfigurationBuilder._();
}

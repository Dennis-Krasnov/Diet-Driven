/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscription_type.g.dart';

class SubscriptionType extends EnumClass {
  static Serializer<SubscriptionType> get serializer => _$subscriptionTypeSerializer;

  ///
  static const SubscriptionType none = _$none;

  ///
  static const SubscriptionType all_access = _$all_access;

  ///
  static const SubscriptionType diet_driven_monthly = _$diet_driven_monthly;

  ///
  static const SubscriptionType diet_driven_yearly = _$diet_driven_yearly;

  ///
  static bool hasDietDrivenAccess(SubscriptionType subscriptionType) {
    return subscriptionType == all_access ||
            subscriptionType == diet_driven_monthly ||
            subscriptionType == diet_driven_yearly;
  }

  const SubscriptionType._(String name) : super(name);

  static BuiltSet<SubscriptionType> get values => _$subscriptionTypeValues;

  static SubscriptionType valueOf(String name) => _$subscriptionType(name);
}

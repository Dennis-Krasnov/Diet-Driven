/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_document.g.dart';

/// Read only user document
abstract class UserDocument implements Built<UserDocument, UserDocumentBuilder> {
  static Serializer<UserDocument> get serializer => _$userDocumentSerializer;

  // TODO: accepted terms

  factory UserDocument([void Function(UserDocumentBuilder b)]) = _$UserDocument;
  UserDocument._();
}

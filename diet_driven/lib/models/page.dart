import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page.g.dart';

/// Bottom navigation pages.
class Page extends EnumClass {
  static Serializer<Page> get serializer => _$pageSerializer;

  /// ...
  static const Page diary = _$diary;

  /// ...
  static const Page track = _$track;

  /// ...
  static const Page reports = _$reports;

  /// ...
  static const Page recipes = _$recipes;

  /// ...
  static const Page settings = _$settings;


  const Page._(String name) : super(name);

  static BuiltSet<Page> get values => _$values;
  static Page valueOf(String name) => _$valueOf(name);
}

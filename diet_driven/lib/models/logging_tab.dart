import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'logging_tab.g.dart';

/// Food logging tab pages.
class LoggingTab extends EnumClass {
//  static Serializer<LoggingTab> get serializer => _$pageSerializer;

  /// ...
  static const LoggingTab recent = _$recent;

  /// ...
  static const LoggingTab frequent = _$frequent;

  /// ...
  static const LoggingTab popular = _$popular;

  /// ...
  static const LoggingTab favorite = _$favorite;

  /// ...
  static const LoggingTab recipes = _$recipes;

  const LoggingTab._(String name) : super(name);

  static BuiltSet<LoggingTab> get values => _$values;
  static LoggingTab valueOf(String name) => _$valueOf(name);
}

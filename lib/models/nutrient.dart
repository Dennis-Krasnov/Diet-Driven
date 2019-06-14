import 'package:built_value/built_value.dart';

part 'nutrient.g.dart';

// TODO: uninstantiable built classes!
@BuiltValue(instantiable: false)
abstract class Nutrient implements Built<Nutrient, NutrientBuilder> {
  String get name;
  num get value;
  String get unit;

//  Nutrient._();
//  factory Nutrient([void Function(NutrientBuilder b)]) = _$Nutrient;
}
//abstract class Nutrient {
//  String get name;
//  num value; // field
//  String get unit;
//}

//abstract class MacroNutrient implements Nutrient, Built<MacroNutrient, MacroNutrientBuilder> {
////  num get caloriesPerGram;
//
//  MacroNutrient._();
//  factory MacroNutrient([void Function(MacroNutrientBuilder b)]) = _$MacroNutrient;
//}

//abstract class MacroNutrient extends Nutrient {
//  num get caloriesPerGram;
//  // Colour
//}
//
//abstract class MicroNutrient extends Nutrient {
//  num get upperLimit;
//  // etc...
//}
//
//// Mixins
//abstract class Vitamin {
//  String get alternativeName;
//}
//
//abstract class Mineral {
//  String get traceOrMajorMineral; // TODO: enum
//  String get periodicTableName;
//}
//
/////////////// TODO: separate files
//
//abstract class Calories implements Nutrient, Built<Calories, CaloriesBuilder> {
//  @override
//  String get name => "Calories";// these are uneditable, value is!
//
//  @override
//  String get unit => "kcal"; // TODO: enum
//
//  Calories._();
//  factory Calories([void Function(CaloriesBuilder b)]) = _$Calories;
//}
//
//abstract class Protein implements MacroNutrient, Built<Protein, ProteinBuilder> {
//
//  @override
//  String get name => "Protein";// these are uneditable, value is!
//
//  @override
//  String get unit => "g"; // TODO: enum
//
//  @override
//  num get caloriesPerGram => 4;
//
//
//  Protein._();
//  factory Protein([void Function(ProteinBuilder b)]) = _$Protein;
//}
//
//// when using mixins it shows up as an overrride instead of implement! (better?)
//abstract class VitaminB1 with Vitamin implements Built<VitaminB1, VitaminB1Builder> {
//  @override
//  String get alternativeName => "Thiamin";
//
//  VitaminB1._();
//  factory VitaminB1([void Function(VitaminB1Builder b)]) = _$VitaminB1;
//}
//
//abstract class Calcium with Mineral implements Built<Calcium, CalciumBuilder> {
//  @override
//  String get traceOrMajorMineral => "trace"; // FIXME
//
//  @override
//  String get periodicTableName => "Ca";
//
//  Calcium._();
//  factory Calcium([void Function(CalciumBuilder b)]) = _$Calcium;
//}

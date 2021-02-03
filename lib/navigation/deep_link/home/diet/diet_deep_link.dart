import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:equatable/equatable.dart';

/// ...
class DietDeepLink extends Equatable {

  // Properties

  // Constructors

  DietDeepLink();

  // Deserialization

  DietDeepLink.deserializeProto(DietDeepLinkProto proto);

  // Serialization

  DietDeepLinkProto serializeProto() {
    return DietDeepLinkProto();
  }

  // Validity

  bool isValid() {
    return true;
  }

  // Equatable

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}
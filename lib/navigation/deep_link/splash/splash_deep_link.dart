import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:equatable/equatable.dart';

class SplashDeepLink extends Equatable {
  
  // Properties
  
  // Constructors
  
  SplashDeepLink();

  // Deserialization
  
  SplashDeepLink.deserializeProto(SplashDeepLinkProto proto);

  // Serialization
  
  SplashDeepLinkProto serializeProto() {
    return SplashDeepLinkProto();
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
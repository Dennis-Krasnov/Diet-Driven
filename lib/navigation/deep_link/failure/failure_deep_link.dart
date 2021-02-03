import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:equatable/equatable.dart';

class FailureDeepLink extends Equatable {

  // Properties

  final String error;

  // Constructors

  FailureDeepLink({this.error});

  // Deserialization

  FailureDeepLink.deserializeProto(FailureDeepLinkProto proto) :
    error = proto.error;

  // Serialization

  FailureDeepLinkProto serializeProto() {
    return FailureDeepLinkProto(
      error: error,
    );
  }

  // Validity

  bool isValid() {
    return error.isNotEmpty;
  }

  // Equatable

  @override
  List<Object> get props => [error];

  @override
  bool get stringify => true;
}
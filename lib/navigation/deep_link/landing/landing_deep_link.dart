import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:equatable/equatable.dart';

class LandingDeepLink extends Equatable {

  // Properties

  final String submittedEmail; // TODO: nullable

  // Constructors

  LandingDeepLink.base() :
    submittedEmail = null;

  LandingDeepLink.submitted(String submittedEmail) :
    submittedEmail = submittedEmail;

  // Deserialization

  LandingDeepLink.deserializeProto(LandingDeepLinkProto proto) :
    submittedEmail = proto.hasSubmittedEmail() ? proto.submittedEmail : null;

  // Serialization

  LandingDeepLinkProto serializeProto() {
    return LandingDeepLinkProto(submittedEmail: submittedEmail);
  }

  // Validity

  bool isValid() {
    return submittedEmail?.isNotEmpty ?? true;
  }

  // Equatable

  @override
  List<Object> get props => [submittedEmail];

  @override
  bool get stringify => true;
}
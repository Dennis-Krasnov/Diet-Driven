import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:equatable/equatable.dart';

class LoginDeepLink extends Equatable {

  // Properties

  final String email;
  final String signInLink;

  // Constructors

  LoginDeepLink({this.email, this.signInLink});

  // Deserialization

  LoginDeepLink.deserializeProto(LoginDeepLinkProto proto) :
    email = proto.email,
    signInLink = proto.signInLink;

  // Serialization

  LoginDeepLinkProto serializeProto() {
    return LoginDeepLinkProto(
      email: email,
      signInLink: signInLink,
    );
  }

  // Validity

  bool isValid() {
    // FIXME actual email, link validation
    if (!email.contains("@")) return false;
    if (!signInLink.contains("https://")) return false;
    return true;
  }

  // Equatable

  @override
  List<Object> get props => [email, signInLink];

  @override
  bool get stringify => true;
}
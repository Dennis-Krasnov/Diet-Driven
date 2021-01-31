import 'package:equatable/equatable.dart';

class LoginDeepLink extends Equatable {
  final String email;
  final String signInLink;

  LoginDeepLink({this.email, this.signInLink});

  bool isValid() {
    // FIXME actual email, link validation
    if (!email.contains("@")) return false;
    if (!signInLink.contains("https://dietdriven.com")) return false;
    return true;
  }

  @override
  List<Object> get props => [email, signInLink];
}
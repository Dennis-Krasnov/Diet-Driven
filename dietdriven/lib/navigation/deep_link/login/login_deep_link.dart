import 'package:equatable/equatable.dart';

class LoginDeepLink extends Equatable {
  final String email;
  final String signInLink;

  LoginDeepLink({this.email, this.signInLink});

  @override
  List<Object> get props => [email, signInLink];
}
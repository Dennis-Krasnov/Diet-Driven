import 'package:equatable/equatable.dart';

/// User account attributes.
// TODO: https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User-class.html
class UserAccount extends Equatable {
  final String email;
  final bool paidUser;

  UserAccount({this.email, this.paidUser = false});

  @override
  List<Object> get props => [email, paidUser];

  @override
  bool get stringify => true;
}

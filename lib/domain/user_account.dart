import 'package:equatable/equatable.dart';

/// User account attributes.
// TODO: https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User-class.html
class UserAccount extends Equatable {
  final bool paidUser;

  UserAccount({this.paidUser = false});

  @override
  List<Object> get props => [paidUser];
}

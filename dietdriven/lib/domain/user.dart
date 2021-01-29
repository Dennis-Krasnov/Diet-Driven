import 'package:equatable/equatable.dart';

/// User account attributes.
// TODO: https://pub.dev/documentation/firebase_auth/latest/firebase_auth/User-class.html
class User extends Equatable {
  final bool paidUser;

  User({this.paidUser = false});

  @override
  List<Object> get props => [paidUser];
}

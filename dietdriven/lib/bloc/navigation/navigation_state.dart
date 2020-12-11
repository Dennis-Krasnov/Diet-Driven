import 'package:dietdriven/domain/user.dart';
import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {}

/// ...
class Unauthorized extends NavigationState {
  @override
  List<Object> get props => [];
}

/// ...
class UnrecoverableFailure extends NavigationState {
  final String error;
  // TODO: add isSignedIn for 2 options, restart app with or without signing out, (only present sign out option if had an account)

  UnrecoverableFailure({this.error});

  @override
  List<Object> get props => [error];
}

/// ...
class Authorized extends NavigationState {
  final User user;

  Authorized({this.user});

  @override
  List<Object> get props => [user];
}
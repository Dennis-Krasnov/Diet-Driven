import 'package:dietdriven/navigation/prelude.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NavigationState extends Equatable {}

/// ...
class Unauthorized extends NavigationState {
  @override
  List<Object> get props => [];
}

/// ...
class UnrecoverableFailure extends NavigationState {
  final String error;
  final String stackTrace;
  // TODO: final bool isAuthorized, offer to sign out only of isAuthorized

  UnrecoverableFailure({this.error, this.stackTrace});

  @override
  List<Object> get props => [error];
}

/// ... (stack of ...)
class Authorized extends NavigationState {
  final List<DeepLinkPayload> history;

  Authorized({@required this.history});

  @override
  List<Object> get props => [history];

  @override
  bool get stringify => true;
}
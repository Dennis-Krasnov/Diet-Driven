import 'package:equatable/equatable.dart';

class FailureDeepLink extends Equatable {
  final String error;

  FailureDeepLink({this.error});

  @override
  List<Object> get props => [error];
}
import 'package:equatable/equatable.dart';

class FailureDeepLink extends Equatable {
  final String error;

  FailureDeepLink({this.error});

  bool isValid() {
    return error.isNotEmpty;
  }

  @override
  List<Object> get props => [error];
}
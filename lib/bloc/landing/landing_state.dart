import 'package:equatable/equatable.dart';

class LandingState extends Equatable {
  /// Email address in text field.
  final String email;

  /// Whether to show validation errors in real-time.
  final bool hasCompletedInput;

  /// Whether email address is valid.
  final bool isValidEmailAddress;

  LandingState({this.email, this.hasCompletedInput, this.isValidEmailAddress});

  @override
  List<Object> get props => [email, hasCompletedInput, isValidEmailAddress];

  @override
  bool get stringify => true;
}
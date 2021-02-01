import 'package:equatable/equatable.dart';

class LandingDeepLink extends Equatable {
  final String submittedEmail; // TODO: nullable

  LandingDeepLink({this.submittedEmail});

  bool isValid() {
    return submittedEmail?.isNotEmpty ?? true;
  }

  @override
  List<Object> get props => [submittedEmail];

  @override
  bool get stringify => true;
}
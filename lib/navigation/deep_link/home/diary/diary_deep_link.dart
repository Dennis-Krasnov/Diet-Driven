import 'package:equatable/equatable.dart';

/// ...
class DiaryDeepLink extends Equatable {
  final String userId;
  final int date;

  DiaryDeepLink({this.userId, this.date});

  bool isValid() {
    if (userId.length != 28) return false;
    if (date < 0) return false;
    return true;
  }

  @override
  List<Object> get props => [userId, date];

  @override
  bool get stringify => true;
}
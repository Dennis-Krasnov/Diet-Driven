import 'package:equatable/equatable.dart';

/// ...
class DiaryDeepLink extends Equatable {
  final String userId;
  final int date;

  DiaryDeepLink({this.userId, this.date});

  @override
  List<Object> get props => [userId, date];

  @override
  bool get stringify => true;
}
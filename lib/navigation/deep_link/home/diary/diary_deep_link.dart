import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:equatable/equatable.dart';

/// ...
class DiaryDeepLink extends Equatable {

  // Properties

  final String userId;
  final int date;

  // Constructors

  DiaryDeepLink({this.userId, this.date});

  DiaryDeepLink.today({this.userId}) : date = 213; // FIXME

  // Deserialization

  DiaryDeepLink.deserializeProto(DiaryDeepLinkProto proto) :
    userId = proto.userUuid,
    date = proto.date;

  // Serialization

  DiaryDeepLinkProto serializeProto() {
    return DiaryDeepLinkProto(
      userUuid: userId,
      date: date,
    );
  }

  // Validity

  bool isValid() {
    if (userId.length != 28) return false;
    if (date < 0) return false;
    return true;
  }

  // Equatable

  @override
  List<Object> get props => [userId, date];

  @override
  bool get stringify => true;
}
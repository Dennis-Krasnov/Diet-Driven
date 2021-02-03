import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:equatable/equatable.dart';

/// ...
class SettingsDeepLink extends Equatable {

  // Properties

  final bool isOnProfile; // TODO: not nullable

  // Constructors

  SettingsDeepLink.base() :
    isOnProfile = false;

  SettingsDeepLink.profile() :
    isOnProfile = true;

  // Deserialization

  SettingsDeepLink.deserializeProto(SettingsDeepLinkProto proto) :
    isOnProfile = proto.isOnProfile;

  // Serialization

  SettingsDeepLinkProto serializeProto() {
    return SettingsDeepLinkProto(
      isOnProfile: isOnProfile,
    );
  }

  // Validity

  bool isValid() {
    return true;
  }

  // Equatable

  @override
  List<Object> get props => [isOnProfile];

  @override
  bool get stringify => true;
}
import 'package:equatable/equatable.dart';

/// ...
class SettingsDeepLink extends Equatable {
  final bool isOnProfile;

  SettingsDeepLink({this.isOnProfile});

  SettingsDeepLink copyWith({
    bool isOnProfile,
  }) => SettingsDeepLink(
    isOnProfile: isOnProfile ?? this.isOnProfile,
  );

  @override
  List<Object> get props => [isOnProfile];

  @override
  bool get stringify => true;
}
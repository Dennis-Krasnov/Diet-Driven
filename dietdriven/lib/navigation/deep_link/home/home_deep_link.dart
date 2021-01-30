import 'package:dietdriven/navigation/deep_link/home/prelude.dart';
import 'package:equatable/equatable.dart';

class HomeDeepLink extends Equatable {
  final HomeDeepLinkPage currentPage;
  final DiaryDeepLink diaryDeepLink;
  final DietDeepLink dietDeepLink;
  final SettingsDeepLink settingsDeepLink;

  HomeDeepLink({this.currentPage, this.diaryDeepLink, this.dietDeepLink, this.settingsDeepLink});

  HomeDeepLink copyWith({
    HomeDeepLinkPage currentPage,
    DiaryDeepLink diaryDeepLink,
    DietDeepLink dietDeepLink,
    SettingsDeepLink settingsDeepLink,
  }) => HomeDeepLink(
    currentPage: currentPage ?? this.currentPage,
    diaryDeepLink: diaryDeepLink ?? this.diaryDeepLink,
    dietDeepLink: dietDeepLink ?? this.dietDeepLink,
    settingsDeepLink: settingsDeepLink ?? this.settingsDeepLink,
  );

  @override
  List<Object> get props => [currentPage, diaryDeepLink, dietDeepLink, settingsDeepLink];

  @override
  bool get stringify => true;
}
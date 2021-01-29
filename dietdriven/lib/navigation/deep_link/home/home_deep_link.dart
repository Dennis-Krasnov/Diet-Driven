import 'package:dietdriven/navigation/deep_link/home/prelude.dart';
import 'package:equatable/equatable.dart';

class HomeDeepLink extends Equatable {
  final HomeDeepLinkPage currentPage;
  final DiaryDeepLink diaryDeepLink;
  final DietDeepLink dietDeepLink;

  HomeDeepLink({this.currentPage, this.diaryDeepLink, this.dietDeepLink});

  HomeDeepLink copyWith({
    HomeDeepLinkPage currentPage,
    DiaryDeepLink diaryDeepLink,
    DietDeepLink dietDeepLink,
  }) => HomeDeepLink(
    currentPage: currentPage ?? this.currentPage,
    diaryDeepLink: diaryDeepLink ?? this.diaryDeepLink,
    dietDeepLink: dietDeepLink ?? this.dietDeepLink,
  );

  @override
  List<Object> get props => [currentPage, diaryDeepLink, dietDeepLink];

  @override
  bool get stringify => true;
}
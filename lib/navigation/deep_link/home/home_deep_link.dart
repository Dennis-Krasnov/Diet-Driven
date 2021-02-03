import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:dietdriven/navigation/deep_link/home/prelude.dart';
import 'package:equatable/equatable.dart';

class HomeDeepLink extends Equatable {

  // Properties

  final HomeDeepLinkPage currentPage; // TODO: not nullable
  final DiaryDeepLink diaryDeepLink;
  final DietDeepLink dietDeepLink;
  final SettingsDeepLink settingsDeepLink;

  // Constructors

  HomeDeepLink.diary(DiaryDeepLink diaryDeepLink) :
    currentPage = HomeDeepLinkPage.diary,
    diaryDeepLink = diaryDeepLink,
    dietDeepLink = null,
    settingsDeepLink = null;

  HomeDeepLink.diet(DietDeepLink dietDeepLink) :
    currentPage = HomeDeepLinkPage.diet,
    diaryDeepLink = null,
    dietDeepLink = dietDeepLink,
    settingsDeepLink = null;

  HomeDeepLink.settings(SettingsDeepLink settingsDeepLink) :
    currentPage = HomeDeepLinkPage.settings,
    diaryDeepLink = null,
    dietDeepLink = null,
    settingsDeepLink = settingsDeepLink;

  // Deserialization

  HomeDeepLink.deserializeProto(HomeDeepLinkProto proto) :
    currentPage = _deserializeProtoCurrentDay(proto.whichCurrentPage()),
    diaryDeepLink = proto.hasDiary() ? DiaryDeepLink.deserializeProto(proto.diary) : null,
    dietDeepLink = proto.hasDiet() ? DietDeepLink.deserializeProto(proto.diet) : null,
    settingsDeepLink = proto.hasSettings() ? SettingsDeepLink.deserializeProto(proto.settings) : null;


  static HomeDeepLinkPage _deserializeProtoCurrentDay(HomeDeepLinkProto_CurrentPage currentPage) {
    switch (currentPage) {
      case HomeDeepLinkProto_CurrentPage.diary:
        return HomeDeepLinkPage.diary;

      case HomeDeepLinkProto_CurrentPage.diet:
        return HomeDeepLinkPage.diet;

      case HomeDeepLinkProto_CurrentPage.settings:
        return HomeDeepLinkPage.settings;

      case HomeDeepLinkProto_CurrentPage.notSet:
        throw Exception("TODO");

      default:
        throw Exception("TODO");
    }
  }

  // Serialization

  HomeDeepLinkProto serializeProto() {
    final protoDeepLink = HomeDeepLinkProto();

    switch (currentPage) {
      case HomeDeepLinkPage.diary:
        protoDeepLink.diary = diaryDeepLink.serializeProto();
        break;
        
      case HomeDeepLinkPage.diet:
        protoDeepLink.diet = dietDeepLink.serializeProto();
        break;
        
      case HomeDeepLinkPage.settings:
        protoDeepLink.settings = settingsDeepLink.serializeProto();
        break;
        
      default:
        throw UnimplementedError("Couldn't serialize DeepLink: Unknown current page $currentPage");
    }
    
    return protoDeepLink;
  }

  // Validity

  bool isValid() {
    switch (currentPage) {
      case HomeDeepLinkPage.diary:
        return diaryDeepLink?.isValid() ?? false;

      case HomeDeepLinkPage.diet:
        return dietDeepLink?.isValid() ?? false;

      case HomeDeepLinkPage.settings:
        return settingsDeepLink?.isValid() ?? false;

      default:
        return false;
    }
  }

  // Equatable

  @override
  List<Object> get props => [currentPage, diaryDeepLink, dietDeepLink, settingsDeepLink];

  @override
  bool get stringify => true;
}
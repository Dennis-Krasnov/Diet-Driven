///
//  Generated code. Do not modify.
//  source: deeplink.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

enum DietDrivenDeepLinkProto_CurrentPage {
  splash, 
  landing, 
  login, 
  failure, 
  home, 
  notSet
}

class DietDrivenDeepLinkProto extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DietDrivenDeepLinkProto_CurrentPage> _DietDrivenDeepLinkProto_CurrentPageByTag = {
    2 : DietDrivenDeepLinkProto_CurrentPage.splash,
    3 : DietDrivenDeepLinkProto_CurrentPage.landing,
    4 : DietDrivenDeepLinkProto_CurrentPage.login,
    5 : DietDrivenDeepLinkProto_CurrentPage.failure,
    6 : DietDrivenDeepLinkProto_CurrentPage.home,
    0 : DietDrivenDeepLinkProto_CurrentPage.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DietDrivenDeepLinkProto', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deeplink'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firebaseDynamicLink')
    ..aOM<SplashDeepLinkProto>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'splash', subBuilder: SplashDeepLinkProto.create)
    ..aOM<LandingDeepLinkProto>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'landing', subBuilder: LandingDeepLinkProto.create)
    ..aOM<LoginDeepLinkProto>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'login', subBuilder: LoginDeepLinkProto.create)
    ..aOM<FailureDeepLinkProto>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'failure', subBuilder: FailureDeepLinkProto.create)
    ..aOM<HomeDeepLinkProto>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'home', subBuilder: HomeDeepLinkProto.create)
    ..hasRequiredFields = false
  ;

  DietDrivenDeepLinkProto._() : super();
  factory DietDrivenDeepLinkProto({
    $core.String firebaseDynamicLink,
    SplashDeepLinkProto splash,
    LandingDeepLinkProto landing,
    LoginDeepLinkProto login,
    FailureDeepLinkProto failure,
    HomeDeepLinkProto home,
  }) {
    final _result = create();
    if (firebaseDynamicLink != null) {
      _result.firebaseDynamicLink = firebaseDynamicLink;
    }
    if (splash != null) {
      _result.splash = splash;
    }
    if (landing != null) {
      _result.landing = landing;
    }
    if (login != null) {
      _result.login = login;
    }
    if (failure != null) {
      _result.failure = failure;
    }
    if (home != null) {
      _result.home = home;
    }
    return _result;
  }
  factory DietDrivenDeepLinkProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DietDrivenDeepLinkProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DietDrivenDeepLinkProto clone() => DietDrivenDeepLinkProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DietDrivenDeepLinkProto copyWith(void Function(DietDrivenDeepLinkProto) updates) => super.copyWith((message) => updates(message as DietDrivenDeepLinkProto)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DietDrivenDeepLinkProto create() => DietDrivenDeepLinkProto._();
  DietDrivenDeepLinkProto createEmptyInstance() => create();
  static $pb.PbList<DietDrivenDeepLinkProto> createRepeated() => $pb.PbList<DietDrivenDeepLinkProto>();
  @$core.pragma('dart2js:noInline')
  static DietDrivenDeepLinkProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DietDrivenDeepLinkProto>(create);
  static DietDrivenDeepLinkProto _defaultInstance;

  DietDrivenDeepLinkProto_CurrentPage whichCurrentPage() => _DietDrivenDeepLinkProto_CurrentPageByTag[$_whichOneof(0)];
  void clearCurrentPage() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get firebaseDynamicLink => $_getSZ(0);
  @$pb.TagNumber(1)
  set firebaseDynamicLink($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirebaseDynamicLink() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirebaseDynamicLink() => clearField(1);

  @$pb.TagNumber(2)
  SplashDeepLinkProto get splash => $_getN(1);
  @$pb.TagNumber(2)
  set splash(SplashDeepLinkProto v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSplash() => $_has(1);
  @$pb.TagNumber(2)
  void clearSplash() => clearField(2);
  @$pb.TagNumber(2)
  SplashDeepLinkProto ensureSplash() => $_ensure(1);

  @$pb.TagNumber(3)
  LandingDeepLinkProto get landing => $_getN(2);
  @$pb.TagNumber(3)
  set landing(LandingDeepLinkProto v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLanding() => $_has(2);
  @$pb.TagNumber(3)
  void clearLanding() => clearField(3);
  @$pb.TagNumber(3)
  LandingDeepLinkProto ensureLanding() => $_ensure(2);

  @$pb.TagNumber(4)
  LoginDeepLinkProto get login => $_getN(3);
  @$pb.TagNumber(4)
  set login(LoginDeepLinkProto v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLogin() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogin() => clearField(4);
  @$pb.TagNumber(4)
  LoginDeepLinkProto ensureLogin() => $_ensure(3);

  @$pb.TagNumber(5)
  FailureDeepLinkProto get failure => $_getN(4);
  @$pb.TagNumber(5)
  set failure(FailureDeepLinkProto v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasFailure() => $_has(4);
  @$pb.TagNumber(5)
  void clearFailure() => clearField(5);
  @$pb.TagNumber(5)
  FailureDeepLinkProto ensureFailure() => $_ensure(4);

  @$pb.TagNumber(6)
  HomeDeepLinkProto get home => $_getN(5);
  @$pb.TagNumber(6)
  set home(HomeDeepLinkProto v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasHome() => $_has(5);
  @$pb.TagNumber(6)
  void clearHome() => clearField(6);
  @$pb.TagNumber(6)
  HomeDeepLinkProto ensureHome() => $_ensure(5);
}

class SplashDeepLinkProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SplashDeepLinkProto', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deeplink'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SplashDeepLinkProto._() : super();
  factory SplashDeepLinkProto() => create();
  factory SplashDeepLinkProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SplashDeepLinkProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SplashDeepLinkProto clone() => SplashDeepLinkProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SplashDeepLinkProto copyWith(void Function(SplashDeepLinkProto) updates) => super.copyWith((message) => updates(message as SplashDeepLinkProto)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SplashDeepLinkProto create() => SplashDeepLinkProto._();
  SplashDeepLinkProto createEmptyInstance() => create();
  static $pb.PbList<SplashDeepLinkProto> createRepeated() => $pb.PbList<SplashDeepLinkProto>();
  @$core.pragma('dart2js:noInline')
  static SplashDeepLinkProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SplashDeepLinkProto>(create);
  static SplashDeepLinkProto _defaultInstance;
}

class LandingDeepLinkProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LandingDeepLinkProto', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deeplink'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'submittedEmail')
    ..hasRequiredFields = false
  ;

  LandingDeepLinkProto._() : super();
  factory LandingDeepLinkProto({
    $core.String submittedEmail,
  }) {
    final _result = create();
    if (submittedEmail != null) {
      _result.submittedEmail = submittedEmail;
    }
    return _result;
  }
  factory LandingDeepLinkProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LandingDeepLinkProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LandingDeepLinkProto clone() => LandingDeepLinkProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LandingDeepLinkProto copyWith(void Function(LandingDeepLinkProto) updates) => super.copyWith((message) => updates(message as LandingDeepLinkProto)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LandingDeepLinkProto create() => LandingDeepLinkProto._();
  LandingDeepLinkProto createEmptyInstance() => create();
  static $pb.PbList<LandingDeepLinkProto> createRepeated() => $pb.PbList<LandingDeepLinkProto>();
  @$core.pragma('dart2js:noInline')
  static LandingDeepLinkProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LandingDeepLinkProto>(create);
  static LandingDeepLinkProto _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get submittedEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set submittedEmail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubmittedEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubmittedEmail() => clearField(1);
}

class LoginDeepLinkProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginDeepLinkProto', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deeplink'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signInLink')
    ..hasRequiredFields = false
  ;

  LoginDeepLinkProto._() : super();
  factory LoginDeepLinkProto({
    $core.String email,
    $core.String signInLink,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (signInLink != null) {
      _result.signInLink = signInLink;
    }
    return _result;
  }
  factory LoginDeepLinkProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginDeepLinkProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginDeepLinkProto clone() => LoginDeepLinkProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginDeepLinkProto copyWith(void Function(LoginDeepLinkProto) updates) => super.copyWith((message) => updates(message as LoginDeepLinkProto)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginDeepLinkProto create() => LoginDeepLinkProto._();
  LoginDeepLinkProto createEmptyInstance() => create();
  static $pb.PbList<LoginDeepLinkProto> createRepeated() => $pb.PbList<LoginDeepLinkProto>();
  @$core.pragma('dart2js:noInline')
  static LoginDeepLinkProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginDeepLinkProto>(create);
  static LoginDeepLinkProto _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get signInLink => $_getSZ(1);
  @$pb.TagNumber(2)
  set signInLink($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignInLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignInLink() => clearField(2);
}

class FailureDeepLinkProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FailureDeepLinkProto', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deeplink'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  FailureDeepLinkProto._() : super();
  factory FailureDeepLinkProto({
    $core.String error,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory FailureDeepLinkProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FailureDeepLinkProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FailureDeepLinkProto clone() => FailureDeepLinkProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FailureDeepLinkProto copyWith(void Function(FailureDeepLinkProto) updates) => super.copyWith((message) => updates(message as FailureDeepLinkProto)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FailureDeepLinkProto create() => FailureDeepLinkProto._();
  FailureDeepLinkProto createEmptyInstance() => create();
  static $pb.PbList<FailureDeepLinkProto> createRepeated() => $pb.PbList<FailureDeepLinkProto>();
  @$core.pragma('dart2js:noInline')
  static FailureDeepLinkProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FailureDeepLinkProto>(create);
  static FailureDeepLinkProto _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
}

enum HomeDeepLinkProto_CurrentPage {
  diary, 
  diet, 
  settings, 
  notSet
}

class HomeDeepLinkProto extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, HomeDeepLinkProto_CurrentPage> _HomeDeepLinkProto_CurrentPageByTag = {
    1 : HomeDeepLinkProto_CurrentPage.diary,
    2 : HomeDeepLinkProto_CurrentPage.diet,
    3 : HomeDeepLinkProto_CurrentPage.settings,
    0 : HomeDeepLinkProto_CurrentPage.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HomeDeepLinkProto', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deeplink'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<DiaryDeepLinkProto>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'diary', subBuilder: DiaryDeepLinkProto.create)
    ..aOM<DietDeepLinkProto>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'diet', subBuilder: DietDeepLinkProto.create)
    ..aOM<SettingsDeepLinkProto>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'settings', subBuilder: SettingsDeepLinkProto.create)
    ..hasRequiredFields = false
  ;

  HomeDeepLinkProto._() : super();
  factory HomeDeepLinkProto({
    DiaryDeepLinkProto diary,
    DietDeepLinkProto diet,
    SettingsDeepLinkProto settings,
  }) {
    final _result = create();
    if (diary != null) {
      _result.diary = diary;
    }
    if (diet != null) {
      _result.diet = diet;
    }
    if (settings != null) {
      _result.settings = settings;
    }
    return _result;
  }
  factory HomeDeepLinkProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomeDeepLinkProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomeDeepLinkProto clone() => HomeDeepLinkProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomeDeepLinkProto copyWith(void Function(HomeDeepLinkProto) updates) => super.copyWith((message) => updates(message as HomeDeepLinkProto)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeDeepLinkProto create() => HomeDeepLinkProto._();
  HomeDeepLinkProto createEmptyInstance() => create();
  static $pb.PbList<HomeDeepLinkProto> createRepeated() => $pb.PbList<HomeDeepLinkProto>();
  @$core.pragma('dart2js:noInline')
  static HomeDeepLinkProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomeDeepLinkProto>(create);
  static HomeDeepLinkProto _defaultInstance;

  HomeDeepLinkProto_CurrentPage whichCurrentPage() => _HomeDeepLinkProto_CurrentPageByTag[$_whichOneof(0)];
  void clearCurrentPage() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  DiaryDeepLinkProto get diary => $_getN(0);
  @$pb.TagNumber(1)
  set diary(DiaryDeepLinkProto v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDiary() => $_has(0);
  @$pb.TagNumber(1)
  void clearDiary() => clearField(1);
  @$pb.TagNumber(1)
  DiaryDeepLinkProto ensureDiary() => $_ensure(0);

  @$pb.TagNumber(2)
  DietDeepLinkProto get diet => $_getN(1);
  @$pb.TagNumber(2)
  set diet(DietDeepLinkProto v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDiet() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiet() => clearField(2);
  @$pb.TagNumber(2)
  DietDeepLinkProto ensureDiet() => $_ensure(1);

  @$pb.TagNumber(3)
  SettingsDeepLinkProto get settings => $_getN(2);
  @$pb.TagNumber(3)
  set settings(SettingsDeepLinkProto v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSettings() => $_has(2);
  @$pb.TagNumber(3)
  void clearSettings() => clearField(3);
  @$pb.TagNumber(3)
  SettingsDeepLinkProto ensureSettings() => $_ensure(2);
}

class DiaryDeepLinkProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DiaryDeepLinkProto', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deeplink'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userUuid')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DiaryDeepLinkProto._() : super();
  factory DiaryDeepLinkProto({
    $core.String userUuid,
    $core.int date,
  }) {
    final _result = create();
    if (userUuid != null) {
      _result.userUuid = userUuid;
    }
    if (date != null) {
      _result.date = date;
    }
    return _result;
  }
  factory DiaryDeepLinkProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiaryDeepLinkProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DiaryDeepLinkProto clone() => DiaryDeepLinkProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DiaryDeepLinkProto copyWith(void Function(DiaryDeepLinkProto) updates) => super.copyWith((message) => updates(message as DiaryDeepLinkProto)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiaryDeepLinkProto create() => DiaryDeepLinkProto._();
  DiaryDeepLinkProto createEmptyInstance() => create();
  static $pb.PbList<DiaryDeepLinkProto> createRepeated() => $pb.PbList<DiaryDeepLinkProto>();
  @$core.pragma('dart2js:noInline')
  static DiaryDeepLinkProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiaryDeepLinkProto>(create);
  static DiaryDeepLinkProto _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set userUuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get date => $_getIZ(1);
  @$pb.TagNumber(2)
  set date($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDate() => clearField(2);
}

class DietDeepLinkProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DietDeepLinkProto', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deeplink'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DietDeepLinkProto._() : super();
  factory DietDeepLinkProto() => create();
  factory DietDeepLinkProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DietDeepLinkProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DietDeepLinkProto clone() => DietDeepLinkProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DietDeepLinkProto copyWith(void Function(DietDeepLinkProto) updates) => super.copyWith((message) => updates(message as DietDeepLinkProto)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DietDeepLinkProto create() => DietDeepLinkProto._();
  DietDeepLinkProto createEmptyInstance() => create();
  static $pb.PbList<DietDeepLinkProto> createRepeated() => $pb.PbList<DietDeepLinkProto>();
  @$core.pragma('dart2js:noInline')
  static DietDeepLinkProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DietDeepLinkProto>(create);
  static DietDeepLinkProto _defaultInstance;
}

class SettingsDeepLinkProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SettingsDeepLinkProto', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deeplink'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isOnProfile', protoName: 'isOnProfile')
    ..hasRequiredFields = false
  ;

  SettingsDeepLinkProto._() : super();
  factory SettingsDeepLinkProto({
    $core.bool isOnProfile,
  }) {
    final _result = create();
    if (isOnProfile != null) {
      _result.isOnProfile = isOnProfile;
    }
    return _result;
  }
  factory SettingsDeepLinkProto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SettingsDeepLinkProto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SettingsDeepLinkProto clone() => SettingsDeepLinkProto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SettingsDeepLinkProto copyWith(void Function(SettingsDeepLinkProto) updates) => super.copyWith((message) => updates(message as SettingsDeepLinkProto)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SettingsDeepLinkProto create() => SettingsDeepLinkProto._();
  SettingsDeepLinkProto createEmptyInstance() => create();
  static $pb.PbList<SettingsDeepLinkProto> createRepeated() => $pb.PbList<SettingsDeepLinkProto>();
  @$core.pragma('dart2js:noInline')
  static SettingsDeepLinkProto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SettingsDeepLinkProto>(create);
  static SettingsDeepLinkProto _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isOnProfile => $_getBF(0);
  @$pb.TagNumber(1)
  set isOnProfile($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsOnProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsOnProfile() => clearField(1);
}


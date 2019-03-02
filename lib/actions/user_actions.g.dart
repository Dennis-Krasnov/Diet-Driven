// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_actions;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$UserActions extends UserActions {
  factory _$UserActions() => new _$UserActions._();
  _$UserActions._() : super._();

  final ActionDispatcher<FirebaseUser> anonymousUserLoaded =
      new ActionDispatcher<FirebaseUser>('UserActions-anonymousUserLoaded');
  final ActionDispatcher<dynamic> anonymousUserFail =
      new ActionDispatcher<dynamic>('UserActions-anonymousUserFail');
  final ActionDispatcher<FirebaseUser> authStateChanged =
      new ActionDispatcher<FirebaseUser>('UserActions-authStateChanged');
  final ActionDispatcher<dynamic> logout =
      new ActionDispatcher<dynamic>('UserActions-logout');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    anonymousUserLoaded.setDispatcher(dispatcher);
    anonymousUserFail.setDispatcher(dispatcher);
    authStateChanged.setDispatcher(dispatcher);
    logout.setDispatcher(dispatcher);
  }
}

class UserActionsNames {
  static final ActionName<FirebaseUser> anonymousUserLoaded =
      new ActionName<FirebaseUser>('UserActions-anonymousUserLoaded');
  static final ActionName<dynamic> anonymousUserFail =
      new ActionName<dynamic>('UserActions-anonymousUserFail');
  static final ActionName<FirebaseUser> authStateChanged =
      new ActionName<FirebaseUser>('UserActions-authStateChanged');
  static final ActionName<dynamic> logout =
      new ActionName<dynamic>('UserActions-logout');
}

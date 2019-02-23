// GENERATED CODE - DO NOT MODIFY BY HAND

part of firestore_actions;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$FirestoreActions extends FirestoreActions {
  factory _$FirestoreActions() => new _$FirestoreActions._();
  _$FirestoreActions._() : super._();

  final ActionDispatcher<String> fbStartDocListen =
      new ActionDispatcher<String>('FirestoreActions-fbStartDocListen');
  final ActionDispatcher<String> fbStopDocListen =
      new ActionDispatcher<String>('FirestoreActions-fbStopDocListen');
  final ActionDispatcher<dynamic> fbDocListenError =
      new ActionDispatcher<dynamic>('FirestoreActions-fbDocListenError');
  final ActionDispatcher<int> startSettingsListen =
      new ActionDispatcher<int>('FirestoreActions-startSettingsListen');
  final ActionDispatcher<int> stopSettingsListen =
      new ActionDispatcher<int>('FirestoreActions-stopSettingsListen');
  final ActionDispatcher<FSPath> subscribe =
      new ActionDispatcher<FSPath>('FirestoreActions-subscribe');
  final ActionDispatcher<FSPath> additionalSubscription =
      new ActionDispatcher<FSPath>('FirestoreActions-additionalSubscription');
  final ActionDispatcher<FSPath> unsubscribe =
      new ActionDispatcher<FSPath>('FirestoreActions-unsubscribe');
  final ActionDispatcher<FS<dynamic>> unsubscribeAll =
      new ActionDispatcher<FS<dynamic>>('FirestoreActions-unsubscribeAll');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    fbStartDocListen.setDispatcher(dispatcher);
    fbStopDocListen.setDispatcher(dispatcher);
    fbDocListenError.setDispatcher(dispatcher);
    startSettingsListen.setDispatcher(dispatcher);
    stopSettingsListen.setDispatcher(dispatcher);
    subscribe.setDispatcher(dispatcher);
    additionalSubscription.setDispatcher(dispatcher);
    unsubscribe.setDispatcher(dispatcher);
    unsubscribeAll.setDispatcher(dispatcher);
  }
}

class FirestoreActionsNames {
  static final ActionName<String> fbStartDocListen =
      new ActionName<String>('FirestoreActions-fbStartDocListen');
  static final ActionName<String> fbStopDocListen =
      new ActionName<String>('FirestoreActions-fbStopDocListen');
  static final ActionName<dynamic> fbDocListenError =
      new ActionName<dynamic>('FirestoreActions-fbDocListenError');
  static final ActionName<int> startSettingsListen =
      new ActionName<int>('FirestoreActions-startSettingsListen');
  static final ActionName<int> stopSettingsListen =
      new ActionName<int>('FirestoreActions-stopSettingsListen');
  static final ActionName<FSPath> subscribe =
      new ActionName<FSPath>('FirestoreActions-subscribe');
  static final ActionName<FSPath> additionalSubscription =
      new ActionName<FSPath>('FirestoreActions-additionalSubscription');
  static final ActionName<FSPath> unsubscribe =
      new ActionName<FSPath>('FirestoreActions-unsubscribe');
  static final ActionName<FS<dynamic>> unsubscribeAll =
      new ActionName<FS<dynamic>>('FirestoreActions-unsubscribeAll');
}

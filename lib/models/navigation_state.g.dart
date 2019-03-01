// GENERATED CODE - DO NOT MODIFY BY HAND

part of navigation_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NavigationState> _$navigationStateSerializer =
    new _$NavigationStateSerializer();

class _$NavigationStateSerializer
    implements StructuredSerializer<NavigationState> {
  @override
  final Iterable<Type> types = const [NavigationState, _$NavigationState];
  @override
  final String wireName = 'NavigationState';

  @override
  Iterable serialize(Serializers serializers, NavigationState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'defaultPage',
      serializers.serialize(object.defaultPage,
          specifiedType: const FullType(Page)),
      'bottomNavigation',
      serializers.serialize(object.bottomNavigation,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Page)])),
    ];

    return result;
  }

  @override
  NavigationState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NavigationStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'defaultPage':
          result.defaultPage = serializers.deserialize(value,
              specifiedType: const FullType(Page)) as Page;
          break;
        case 'bottomNavigation':
          result.bottomNavigation = serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Page)]))
              as BuiltList;
          break;
      }
    }

    return result.build();
  }
}

class _$NavigationState extends NavigationState {
  @override
  final Page activePage;
  @override
  final Page defaultPage;
  @override
  final BuiltList<Page> bottomNavigation;
  @override
  final Page bottomNavigationPage;

  factory _$NavigationState([void updates(NavigationStateBuilder b)]) =>
      (new NavigationStateBuilder()..update(updates)).build()
          as _$NavigationState;

  _$NavigationState._(
      {this.activePage,
      this.defaultPage,
      this.bottomNavigation,
      this.bottomNavigationPage})
      : super._() {
    if (activePage == null) {
      throw new BuiltValueNullFieldError('NavigationState', 'activePage');
    }
    if (defaultPage == null) {
      throw new BuiltValueNullFieldError('NavigationState', 'defaultPage');
    }
    if (bottomNavigation == null) {
      throw new BuiltValueNullFieldError('NavigationState', 'bottomNavigation');
    }
  }

  @override
  NavigationState rebuild(void updates(NavigationStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$NavigationStateBuilder toBuilder() =>
      new _$NavigationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationState &&
        activePage == other.activePage &&
        defaultPage == other.defaultPage &&
        bottomNavigation == other.bottomNavigation &&
        bottomNavigationPage == other.bottomNavigationPage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, activePage.hashCode), defaultPage.hashCode),
            bottomNavigation.hashCode),
        bottomNavigationPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationState')
          ..add('activePage', activePage)
          ..add('defaultPage', defaultPage)
          ..add('bottomNavigation', bottomNavigation)
          ..add('bottomNavigationPage', bottomNavigationPage))
        .toString();
  }
}

class _$NavigationStateBuilder extends NavigationStateBuilder {
  _$NavigationState _$v;

  @override
  Page get activePage {
    _$this;
    return super.activePage;
  }

  @override
  set activePage(Page activePage) {
    _$this;
    super.activePage = activePage;
  }

  @override
  Page get defaultPage {
    _$this;
    return super.defaultPage;
  }

  @override
  set defaultPage(Page defaultPage) {
    _$this;
    super.defaultPage = defaultPage;
  }

  @override
  BuiltList<Page> get bottomNavigation {
    _$this;
    return super.bottomNavigation;
  }

  @override
  set bottomNavigation(BuiltList<Page> bottomNavigation) {
    _$this;
    super.bottomNavigation = bottomNavigation;
  }

  @override
  Page get bottomNavigationPage {
    _$this;
    return super.bottomNavigationPage;
  }

  @override
  set bottomNavigationPage(Page bottomNavigationPage) {
    _$this;
    super.bottomNavigationPage = bottomNavigationPage;
  }

  _$NavigationStateBuilder() : super._();

  NavigationStateBuilder get _$this {
    if (_$v != null) {
      super.activePage = _$v.activePage;
      super.defaultPage = _$v.defaultPage;
      super.bottomNavigation = _$v.bottomNavigation;
      super.bottomNavigationPage = _$v.bottomNavigationPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationState;
  }

  @override
  void update(void updates(NavigationStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationState build() {
    final _$result = _$v ??
        new _$NavigationState._(
            activePage: activePage,
            defaultPage: defaultPage,
            bottomNavigation: bottomNavigation,
            bottomNavigationPage: bottomNavigationPage);
    replace(_$result);
    return _$result;
  }
}

class _$NavigationStateDocument extends NavigationStateDocument {
  @override
  final String userId;
  @override
  final StreamSubscription streamSubscription;

  factory _$NavigationStateDocument(
          [void updates(NavigationStateDocumentBuilder b)]) =>
      (new NavigationStateDocumentBuilder()..update(updates)).build();

  _$NavigationStateDocument._({this.userId, this.streamSubscription})
      : super._();

  @override
  NavigationStateDocument rebuild(
          void updates(NavigationStateDocumentBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationStateDocumentBuilder toBuilder() =>
      new NavigationStateDocumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationStateDocument && userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationStateDocument')
          ..add('userId', userId)
          ..add('streamSubscription', streamSubscription))
        .toString();
  }
}

class NavigationStateDocumentBuilder
    implements
        Builder<NavigationStateDocument, NavigationStateDocumentBuilder> {
  _$NavigationStateDocument _$v;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  StreamSubscription _streamSubscription;
  StreamSubscription get streamSubscription => _$this._streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription) =>
      _$this._streamSubscription = streamSubscription;

  NavigationStateDocumentBuilder();

  NavigationStateDocumentBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _streamSubscription = _$v.streamSubscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationStateDocument other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationStateDocument;
  }

  @override
  void update(void updates(NavigationStateDocumentBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationStateDocument build() {
    final _$result = _$v ??
        new _$NavigationStateDocument._(
            userId: userId, streamSubscription: streamSubscription);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

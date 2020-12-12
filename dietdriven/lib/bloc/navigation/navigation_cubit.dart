import 'dart:async';

import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/domain/user.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Manages navigation state.
class NavigationCubit extends Cubit<NavigationState> {
  final AuthenticationRepository _authenticationRepository;

  NavigationCubit(this._authenticationRepository) : super(Unauthorized());

  StreamSubscription<NavigationState> _authenticationSubscription;

  Future<void> initializeSubscription() async {
    // Maintain single instance of stream subscription
    await _authenticationSubscription?.cancel();

    // Reset cubit state
    if (state is! Unauthorized) {
      print("reset cubit state");
      emit(Unauthorized());
    }
    
    // Maps nullable user to navigation state
    _authenticationSubscription = _authenticationRepository.authStateChanges()
      .transform<NavigationState>(StreamTransformer.fromHandlers(
        handleData: (user, sink) {
          if (user == null) {
            sink.add(Unauthorized());
            return;
          }

          if (state is Authorized) {
            print("PREVIOUS");
            return;
          }

          print("EMPTY/default");
          sink.add(Authorized(history: [DeepLinkPayload.details(0)])); // TODO: create a constructor on Authorized for this
        },
        handleError: (error, stacktrace, sink) {
          // TODO: test this!
          sink.add(UnrecoverableFailure(error: error.toString(), stackTrace: stacktrace.toString()));
        },
        handleDone: (sink) {
          sink.add(UnrecoverableFailure(error: "Authentication state stream ended"));
        },
      ))
      .listen(emit);
  }

  void replace(DeepLinkPayload deepLinkPayload) {

  }

  void push(DeepLinkPayload deepLinkPayload) {

  }

  bool pop() {
    assert(state is Authorized); // FIXME
    final authorized = state as Authorized;

    if (authorized.history.length == 1) {
      // Quit from application
      return false;
    }

    emit(Authorized(history: List.from(authorized.history)..removeLast()));

    // Don't quit from application
    return true;
  }

  void goto(int index) {
    assert(state is Authorized); // FIXME
    final authorized = state as Authorized;
    print("goto $index, $state");
    emit(Authorized(history: List.from(authorized.history)..add(DeepLinkPayload.details(index))));
  }
}
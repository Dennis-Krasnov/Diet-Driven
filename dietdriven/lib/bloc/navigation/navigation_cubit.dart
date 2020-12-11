import 'dart:async';

import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/domain/user.dart';
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
      emit(Unauthorized());
    }
    
    // Maps nullable user to navigation state
    _authenticationSubscription = _authenticationRepository.authStateChanges()
      .map((User user) { // TODO: nullable User?
        if (user == null) {
          return Unauthorized();
        }
        return Authorized(user: user);
      })
      .listen(emit, onError: (err) => UnrecoverableFailure(error: err.toString()));
  }
}
import 'package:dietdriven/bloc/landing/landing_state.dart';
import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Manages landing page's email form.
/// Performs inline/just-in-time validation to reduce interaction cost.
/// Showing validation errors immediately while typing is very distracting, so it's delayed until input is complete.
class LandingCubit extends Cubit<LandingState> {
  final NavigationCubit _navigationCubit;
  final AuthenticationRepository _authenticationRepository;

  LandingCubit(this._navigationCubit, this._authenticationRepository) : super(LandingState(email: "", hasCompletedInput: false, isValidEmailAddress: false));

  /// Updates user' email.
  /// If user hasn't updated their email in a while, assume they're finished.
  Future<void> updateEmail(String email) async {
    emit(LandingState(email: email, hasCompletedInput: state.hasCompletedInput, isValidEmailAddress: state.isValidEmailAddress));
    validateEmail();

    // Doesn't trigger unnecessarily
    if (!state.hasCompletedInput) {
      await Future.delayed(const Duration(seconds: 3));
      final typedAnythingNew = email != state.email;

      if (!typedAnythingNew) {
        completeInput();
      }
    }
  }

  /// Starts showing validation errors in real-time.
  /// This is an idempotent operation.
  void completeInput() {
    if (!state.hasCompletedInput) {
      emit(LandingState(email: state.email, hasCompletedInput: true, isValidEmailAddress: state.isValidEmailAddress));
    }
  }

  /// Updates success/error state based on whether email is valid.
  void validateEmail() {
    final regex = RegExp(r"\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b", caseSensitive: false);
    final isValid = regex.hasMatch(state.email);

    emit(LandingState(email: state.email, hasCompletedInput: state.hasCompletedInput, isValidEmailAddress: isValid));
  }

  /// Sends magic link to user's email.
  /// Shows error message or navigates to successful submission page.
  void sendMagicLink() async {
    final errorMessage = await _authenticationRepository.sendSignInLinkToEmail(state.email);

    if (errorMessage != null) {
      // TODO: show an error state!
      print("ERROR: $errorMessage");
      return;
    }

    _navigationCubit.push(DeepLink(
      currentPage: DeepLinkPage.landing,
      landingDeepLink: LandingDeepLink(
        submittedEmail: state.email,
      ),
    ));
  }
}
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Manages submitted landing page's buttons.
class LandingSubmittedCubit extends Cubit<void> {
  final AuthenticationRepository _authenticationRepository;

  LandingSubmittedCubit(this._authenticationRepository) : super(null);

  /// Re-sends magic link to user's email.
  /// Shows error message.
  void resendMagicLink(String email) async {
    final errorMessage = await _authenticationRepository.sendSignInLinkToEmail(email);

    if (errorMessage != null) {
      // TODO: show an error state!
      print("ERROR: $errorMessage");
      return;
    }
  }

  // FIXME: temporary, do it through firebase dynamic link instead.
  void signInWithEmailLink(String email, String emailLink) {
    _authenticationRepository.signInWithEmailLink(email, emailLink);
  }
}
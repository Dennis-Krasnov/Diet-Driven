import 'package:dietdriven/bloc/landing_submitted/landing_submitted_cubit.dart';
import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/widget/build_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingSubmittedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Rebuild only when the selected part of navigation state changes
    final submittedEmail = context.select((NavigationCubit cubit) => cubit.state.deepLinkHistory.last?.landingDeepLink?.submittedEmail);

    buildLog.v("LandingSubmittedScreen - rebuild: submittedEmail=$submittedEmail");

    // Handle race condition between the navigator removing this page and the navigation state updating
    if (submittedEmail == null) {
      return Container();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Expanded(child: Container()),
              Image.asset("assets/logo.png", width: 400 * 0.25, height: 302 * 0.25),
              Expanded(child: Container()),
              Text(
                "Check your email",
                style: Theme.of(context).textTheme.headline5,
              ),
              TextField(
                onChanged: (emailLink) => context.read<LandingSubmittedCubit>().signInWithEmailLink(submittedEmail, emailLink),
              ),
              SizedBox(height: 8),
              Text(
                "A magic link has been sent to $submittedEmail. Click that link to login.",
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => context.read<LandingSubmittedCubit>().resendMagicLink(submittedEmail),
                child: Text("Resend magic link"),
              ),
              FlatButton(
                onPressed: () => context.read<NavigationCubit>().pop(),
                child: Text("Wrong email?"),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}

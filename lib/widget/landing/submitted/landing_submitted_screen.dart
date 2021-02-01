import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingSubmittedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve part of a state and react to changes only when the selected part changes
    final submittedEmail = context.select((NavigationCubit cubit) => cubit.state.currentDeepLink.landingDeepLink.submittedEmail);

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
                // TODO: wrap in cubit!
                onChanged: (emailLink) => context.read<AuthenticationRepository>().signInWithEmailLink(submittedEmail, emailLink),
              ),
              SizedBox(height: 8),
              Text(
                "A magic link has been sent to $submittedEmail. Click that link to login.",
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: Text("Resend magic link"),
              ),
              FlatButton(
                onPressed: () {},
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

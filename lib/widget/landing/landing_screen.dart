import 'package:dietdriven/bloc/landing/landing_cubit.dart';
import 'package:dietdriven/bloc/landing/prelude.dart';
import 'package:dietdriven/widget/build_logger.dart';
import 'package:dietdriven/widget/landing/success_fail_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  FocusNode textFocus;
  FocusNode buttonFocus;

  @override
  void initState() {
    super.initState();
    textFocus = FocusNode();
    buttonFocus = FocusNode();
  }

  @override
  void dispose() {
    textFocus.dispose();
    buttonFocus.dispose();
    super.dispose();
  }

  void onEditingComplete() {
    final cubit = context.read<LandingCubit>();

    cubit.completeInput();

    if (cubit.state.isValidEmailAddress) {
      buttonFocus.requestFocus();
    }
  }

  void onButtonPressed() {
    final cubit = context.read<LandingCubit>();

    cubit.completeInput();

    // Button is initially enabled, so email might be invalid
    if (!cubit.state.isValidEmailAddress) {
      textFocus.requestFocus();
      return;
    }

    buttonFocus.requestFocus();
    cubit.sendMagicLink();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingCubit, LandingState>(
      builder: (context, state) {
        buildLog.v("LandingScreen - rebuild: completed=${state.hasCompletedInput}, valid=${state.isValidEmailAddress}");
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
                    "Welcome to Diet Driven",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Get a magic link sent to your email that'll sign you in instantly!",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(height: 32),
                  TextField(
                    onChanged: (email) => context.read<LandingCubit>().updateEmail(email),
                    onEditingComplete: onEditingComplete,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: textFocus,
                    // TODO: make a prettier text input, consistent border
                    decoration: InputDecoration(
                      labelText: "Email",
                      // errorBorder: UnderlineInputBorder(),
                      // errorText: state.hasCompletedInput && !state.isValidEmailAddress ? "" : null,
                      // border: UnderlineInputBorder(borderSide: BorderSide(color: !state.hasCompletedInput || state.isValidEmailAddress ? Colors.blue : Colors.red)),
                      // focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                      suffixIcon: state.hasCompletedInput ? SuccessFailIcon(isSuccess: state.isValidEmailAddress) : null,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    // Optimistically enable button when user hasn't completed input
                    onPressed: !state.hasCompletedInput || state.isValidEmailAddress ? onButtonPressed : null,
                    child: Text("Send magic link"),
                    focusNode: buttonFocus,
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
        );
      }
    );
  }
}

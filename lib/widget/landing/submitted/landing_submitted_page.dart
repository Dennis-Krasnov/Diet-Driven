import 'package:dietdriven/bloc/landing_submitted/landing_submitted_cubit.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:dietdriven/widget/build_logger.dart';
import 'package:dietdriven/widget/landing/submitted/landing_submitted_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingSubmittedPage extends Page<void> {
  LandingSubmittedPage() : super(key: Key("Landing Submitted Page"));

  @override
  Route<void> createRoute(BuildContext context) {
    buildLog.v("LandingSubmittedPage - createRoute");
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (BuildContext context) => LandingSubmittedCubit(context.read<AuthenticationRepository>()),
        child: LandingSubmittedScreen(),
      ),
      settings: this,
    );
  }
}

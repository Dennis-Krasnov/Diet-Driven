import 'package:dietdriven/bloc/landing/landing_cubit.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:dietdriven/widget/landing/landing_screen.dart';
import 'package:dietdriven/widget/landing/submitted/landing_submitted_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingSubmittedPage extends Page<void> {
  LandingSubmittedPage() : super(key: Key("Landing Submitted Page"));

  @override
  Route<void> createRoute(BuildContext context) {
    print("landing page create route");
    return MaterialPageRoute(
      builder: (context) => LandingSubmittedScreen(),
      settings: this,
    );
  }
}

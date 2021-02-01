import 'package:dietdriven/bloc/landing/landing_cubit.dart';
import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:dietdriven/widget/landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends Page<void> {
  LandingPage() : super(key: Key("Landing Page"));

  @override
  Route<void> createRoute(BuildContext context) {
    print("landing page create route");
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (BuildContext context) => LandingCubit(context.read<NavigationCubit>(), context.read<AuthenticationRepository>()),
        child: LandingScreen(),
      ),
      settings: this,
    );
  }
}

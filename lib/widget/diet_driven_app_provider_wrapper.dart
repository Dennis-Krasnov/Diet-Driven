import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:dietdriven/repository/authentication/dummy_authentication_repository.dart';
import 'package:logger_flutter/logger_flutter.dart';
import 'package:dietdriven/repository/authentication/firebase_authentication_repository.dart';
import 'package:dietdriven/widget/diet_driven_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Wraps application with flutter_bloc repository and bloc providers.
/// Implementations of repositories can be swapped out.
class DietDrivenAppProviderWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          // create: (context) => DummyAuthenticationRepository(),
          create: (context) => FirebaseAuthenticationRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => NavigationCubit(context.read<AuthenticationRepository>())..initializeSubscription(),
          ),
        ],
        child: LogConsoleOnShake(
          dark: false,
          debugOnly: false, // FIXME
          child: DietDrivenApp(),
        ),
      ),
    );
  }
}

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SubscriptionEditBloc subscriptionEditBloc = BlocProvider.of<SubscriptionEditBloc>(context);

    return BlocBuilder<UserDataEvent, UserDataState>(
      bloc: BlocProvider.of<UserDataBloc>(context),
      builder: (BuildContext context, UserDataState userDataState) {
        // TODO: also build off of subscription bloc, show loading, etc
        return Scaffold(
          appBar: AppBar(title: const Text("Subscription")),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                DropdownButton<SubscriptionType>(
                  items: [
                    for (var sub in SubscriptionType.values)
                      DropdownMenuItem(
                        value: sub,
                        child: Text(sub.toString()),
                      )
                  ],
                  onChanged: (SubscriptionType newValue) => subscriptionEditBloc.dispatch(Subscribe((b) => b
                    ..subscriptionType = newValue
                    ..completer = infoSnackBarCompleter(context, "subscribed to $newValue") // TODO: welcome to pro / sorry to see you go screen
                  )),
                  value: (userDataState as UserDataLoaded).subscription,
                  // TODO: loading state!
                )
              ],
            )
          )
        );
      }
    );
  }
}

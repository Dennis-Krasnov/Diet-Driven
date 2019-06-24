import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    final NavigationBloc navigationBloc = BlocProvider.of<NavigationBloc>(context);

    return BlocListener<NavigationEvent, NavigationState>(
      bloc: navigationBloc,
      listener: (BuildContext context, NavigationState state) {
        // Deep link handler
        if (state is SettingsTab && state.deepLink != null) {
          if (state.deepLink is ProfileDeepLink) {
            final SettingsDeepLink link = state.deepLink;


            // TODO: push to 'profile/settings'

//            if (link.setting != null) {
            // TODO: then push to 'profile/settings/...' (so that back button works)
//            }


//            print("SETTING IS ${link.setting}");

            // TODO: reusable method
//            if (Navigator.of(context).canPop())
//              Navigator.of(context).popUntil(ModalRoute.withName('/'));
//            Navigator.of(context).pushNamed("settings/profile");
          }

          if (state.deepLink is SubscriptionDeepLink) {
            final SubscriptionDeepLink link = state.deepLink;

            print("SUBSCRIPTION IS ${link.subscriptionType}");
            if (Navigator.of(context).canPop())
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            Navigator.of(context).pushNamed("settings/subscription");
          }

          if (state.deepLink is ThemeDeepLink) {
            if (Navigator.of(context).canPop())
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            Navigator.of(context).pushNamed("settings/theme");
          }

          // Clearing deep link to ensure it's only called once
          navigationBloc.dispatch(ClearDeepLink());
        }
      },
      child: BlocBuilder<UserDataEvent, UserDataState>(
        bloc: _userDataBloc,
        condition: (previous, current) => true,
        builder: (BuildContext context, UserDataState userDataState) {
          if (userDataState is UserDataLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Settings"),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => null,
                  )
                ],
              ),
              body: SafeArea(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset("assets/settings.png"),
                      title: const Text("General"),
                      subtitle: const Text("Language, Units, Time"),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: Image.asset("assets/profile.png"),
                      title: const Text("Profile"),
                      subtitle: const Text("Goals, "),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: Image.asset("assets/wallet.png"),
                      title: const Text("Subscription"),
                      subtitle: Text(userDataState.userDocument.currentSubscription == SubscriptionType.none
                          ? "Not currently subscribed"
                          : "Subscribed to ${userDataState.userDocument.currentSubscription.toString()}"
                      ),
                      onTap: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
                        ..deepLink = SubscriptionDeepLink((b) => b..subscriptionType = SubscriptionType.diet_driven_yearly)
                      )),
                    ),
                    ListTile(
                      leading: Image.asset("assets/food.png"),
                      title: const Text("Diary"),
                      subtitle: const Text("..."),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: Image.asset("assets/track.png"),
                      title: const Text("Track"),
                      subtitle: const Text("Under development..."),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: Image.asset("assets/graph.png"),
                      title: const Text("Reports"),
                      subtitle: const Text("Under development..."),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: Image.asset("assets/colour.png"),
                      title: const Text("Theme"),
                      subtitle: const Text("Dark mode, Colour scheme"),
                      onTap: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
                        ..deepLink = ThemeDeepLink()
                      )),
                    ),
                    ListTile(
                      leading: Image.asset("assets/sync.png"),
                      title: const Text("Integrations"),
                      subtitle: const Text("Under development..."),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: Image.asset("assets/cart.png"),
                      title: const Text("About"),
                      subtitle: const Text("Under development..."),
                      onTap: () => null,
                    ),
                  ],
                )
              )
            );
          }
        }
      )
    );
  }
}

//                      IconButton(
//                          icon: const Icon(Icons.settings),
//                          onPressed: () {
// TODO: dispatch event in order to clear previous deep links!!!
//                      Navigator.of(context).pushNamed("profile/settings");
//                            BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToProfile((b) => b
//                              ..deepLink = SettingsDeepLink()
//                            ));
//                          }
//                      ),
//                          RaisedButton(
//                            child: const Text("go to settings parameterized"),
//                            onPressed: () => BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
//                              ..deepLink = SettingsDeepLink((b) => b..setting = Random().nextInt(10000).toString())
//                            )),
//                          ),

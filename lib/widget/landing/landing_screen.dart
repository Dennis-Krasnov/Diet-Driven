import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text(
                "Get a magic link sent to your email that'll sign you in instantly!",
                style: Theme.of(context).textTheme.caption,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Sign in with magic link"),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
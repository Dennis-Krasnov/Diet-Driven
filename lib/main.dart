import 'package:dietdriven/widget/diet_driven_app_provider_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  // Initialize Firebase SDK
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initialize Flutter application
  runApp(DietDrivenAppProviderWrapper());
}
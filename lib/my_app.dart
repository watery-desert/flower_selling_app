import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'onboarding/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(context),
      home: OnboardingScreen(),
    );
  }
}

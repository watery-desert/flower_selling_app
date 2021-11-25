import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Image.asset(
        'assets/logo.png',
        height: 150,
        width: 150,
      ),
    );
  }
}
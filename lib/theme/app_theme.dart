import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) => ThemeData(
      fontFamily: 'Asap',
      colorScheme: Theme.of(context).colorScheme.copyWith(
            secondary: const Color(0xFF2A78BF),
          ),
      canvasColor: const Color(0xFFEFF1DE),
    );

import 'package:flutter/material.dart';

const _kLightTextIconColor = Color(0xFF5A5555);
const _kDarkTextIconColor = Color(0xFFECECEC);

ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: 'Asap',
      colorScheme: Theme.of(context).colorScheme.copyWith(
            secondary: const Color(0xFFF05F56),
          ),
      splashColor: Colors.transparent,
      canvasColor: const Color(0xFFEFF1DE),
      cardColor: Colors.white,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      textTheme: const TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        subtitle1: TextStyle(),
        caption: TextStyle(),
        headline5: TextStyle(),
      ).apply(
        bodyColor: _kLightTextIconColor,
        displayColor: _kLightTextIconColor,
      ),
      // primaryTextTheme: const TextTheme(
      //   headline6: TextStyle(color: _kLightTextIconColor),
      // ),
    );

ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: 'Asap',
      colorScheme: Theme.of(context).colorScheme.copyWith(
            secondary: const Color(0xFFFF7971),
            brightness: Brightness.dark,
          ),
      splashColor: Colors.transparent,
      cardColor: const Color(0xFF585858),
      buttonTheme: const ButtonThemeData(
        buttonColor: _kDarkTextIconColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF585858)),
      canvasColor: const Color(0xFF3F3F3F),
      textTheme: const TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        subtitle1: TextStyle(),
        caption: TextStyle(),
        headline5: TextStyle(),
      ).apply(
        bodyColor: _kDarkTextIconColor,
        displayColor: _kDarkTextIconColor,
      ),
    );

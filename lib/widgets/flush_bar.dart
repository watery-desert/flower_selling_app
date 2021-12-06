import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

showMessage(
    {required BuildContext context,
    required IconData icon,
    required String code,
    required String message}) {
  return Flushbar(
    title: code,
    message: message,
    borderRadius: BorderRadius.circular(8.0),
    boxShadows: const [
      BoxShadow(
        color: Color(0x40000000),
        offset: Offset(4, 4),
        blurRadius: 8.0,
      )
    ],
    icon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        color: Colors.white,
        size: 18,
      ),
    ),
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    backgroundColor: Colors.redAccent,
    flushbarPosition: FlushbarPosition.TOP,
    forwardAnimationCurve: Curves.easeOutCirc,
    reverseAnimationCurve: Curves.easeInCubic,
    animationDuration: const Duration(milliseconds: 400),
    duration: const Duration(seconds: 3),
  )..show(context);
}

  // static void showConfirmation(
  //     BuildContext context, String? code, String? message) {
  //   Flushbar(
  //     title: code,
  //     message: message,
  //     borderRadius:  BorderRadius.circular(8.0),
  //     boxShadows: [
  //       BoxShadow(
  //         color: Color(0x40000000),
  //         offset: Offset(4, 4),
  //         blurRadius: 8.0,
  //       )
  //     ],
  //     icon: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Icon(
  //         FontAwesomeIcons.checkCircle,
  //         color: Colors.white,
  //         size: 18,
  //       ),
  //     ),
  //     padding: const EdgeInsets.all(16),
  //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     backgroundColor: Colors.green[300]!,
  //     flushbarPosition: FlushbarPosition.TOP,
  //     forwardAnimationCurve: Curves.easeOutCirc,
  //     reverseAnimationCurve: Curves.easeInCubic,
  //     animationDuration: Duration(milliseconds: 400),
  //     duration: Duration(seconds: 3),
  //   )..show(context);
  // }

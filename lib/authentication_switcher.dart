import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup/signup.dart';
import 'login/view/login.dart';
import 'dart:math' as math;
import 'login/login.dart';

class AuthenticationSwitcher extends StatefulWidget {
  const AuthenticationSwitcher({Key? key}) : super(key: key);

  @override
  _AuthenticationSwitcherState createState() => _AuthenticationSwitcherState();
}

class _AuthenticationSwitcherState extends State<AuthenticationSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  bool showLogIn = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: math.pi).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutQuart,
        reverseCurve: Curves.easeOutQuart,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          if (_rotationAnimation.value >= (math.pi / 2)) {
            showLogIn = false;
          } else {
            showLogIn = true;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_rotationAnimation.value),
              child: showLogIn
                  ? LoginScreen(
                      onTap: () {
                        _animationController.forward();
                      },
                    )
                  : SignUp(
                      onTap: () {
                        _animationController.reverse();
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}

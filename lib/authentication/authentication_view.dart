import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './signup/signup.dart';
import './login/login.dart';
import 'dart:math' as math;


class AuthenticationView extends StatefulWidget {
  const AuthenticationView._({Key? key}) : super(key: key);

  static Route show() => MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(
                repository: context.read<AuthenticationRepository>(),
              ),
            ),
            BlocProvider<SignupCubit>(
              create: (context) => SignupCubit(
                repository: context.read<AuthenticationRepository>(),
              ),
            )
          ],
          child: const AuthenticationView._(),
        ),
      );

  @override
  _AuthenticationViewState createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView>
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
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(math.pi),
                      child: SignUp(
                        onTap: () {
                          _animationController.reverse();
                        },
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import '../widgets/text_input_field.dart';
import '../widgets/filled_button.dart';
import '../widgets/tap_buttom.dart';
import 'dart:math' as math;

class SignUp extends StatelessWidget {
  final VoidCallback onTap;
  const SignUp({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(math.pi),
      child: Column(
        children: [
          AppLogo(),
          SizedBox(
            height: 48,
          ),
          TextInputField(
            hintText: 'Name',
            onChange: (value) {},
            errorText: null,
          ),
          SizedBox(
            height: 48,
          ),
          TextInputField(
            hintText: 'Email',
            onChange: (value) {},
            errorText: null,
          ),
          SizedBox(
            height: 48,
          ),
          TextInputField(
            hintText: 'Password',
            onChange: (value) {},
            errorText: null,
          ),
          SizedBox(
            height: 56,
          ),
          FilledButton(
            title: 'Create Account',
            color: Color(0xFF6E7BF4),
            onTap: () {},
          ),
          Expanded(child: SizedBox()),
          SafeArea(
            top: false,
            child: TapButton(
              title: 'Already have account',
              onTap: onTap,
            ),
          )
        ],
      ),
    );
  }
}

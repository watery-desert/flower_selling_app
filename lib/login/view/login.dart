import 'package:flower_selling_app/login/models/email.dart';
import 'package:flower_selling_app/login/models/password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/tap_buttom.dart';

import '../../widgets/filled_button.dart';
import '../../widgets/text_input_field.dart';
import 'package:formz/formz.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onTap;

  LoginScreen({Key? key, required this.onTap}) : super(key: key);

  Widget _socialIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.grey,
      size: 30,
    );
  }

  final LoginCubit loginCubit = LoginCubit();

  String _showEmailErrorMessage(EmailValidationError? error) {
    if (error == EmailValidationError.empty) {
      return 'Empty password';
    } else if (error == EmailValidationError.invalid) {
      return 'Invalid password';
    } else {
      return 'error';
    }
  }

  String _showPasswordErrorMessage(PasswordValidationError? error) {
    if (error == PasswordValidationError.empty) {
      return 'Empty Email';
    } else if (error == PasswordValidationError.invalid) {
      return 'Invalid Email';
    } else {
      return 'error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: loginCubit,
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('login succeeded'),
            ),
          );
        }
      },
      child: Column(
        children: [
          const AppLogo(),
          const SizedBox(height: 48),
          BlocBuilder<LoginCubit, LoginState>(
            bloc: loginCubit,
            buildWhen: (previous, current) => previous.email != current.email,
            builder: (context, state) {
              final bool showError = state.email.invalid;
              final buttonTapped = state.buttonTapped;

              return TextInputField(
                hintText: 'Email',
                onChange: (value) {
                  loginCubit.onEmailChange(value);
                },
                errorText: buttonTapped && showError
                    ? _showEmailErrorMessage(state.email.error)
                    : null,
              );
            },
          ),
          const SizedBox(height: 48),
          BlocBuilder<LoginCubit, LoginState>(
            bloc: loginCubit,
            buildWhen: (previous, current) =>
                previous.password != current.password,
            builder: (context, state) {
              final showError = state.password.invalid;
              final buttonTapped = state.buttonTapped;

              return TextInputField(
                hintText: 'Password',
                onChange: (value) {
                  loginCubit.onPasswordChange(value);
                },
                errorText: buttonTapped && showError
                    ? _showPasswordErrorMessage(state.password.error)
                    : null,
              );
            },
          ),
          const SizedBox(height: 48),
          BlocBuilder<LoginCubit, LoginState>(
            bloc: loginCubit,
            builder: (context, state) {
              return FilledButton(
                onTap: () {
                  loginCubit.loginWithEmailAndPassword();
                },
                title:
                    state.status.isSubmissionInProgress ? 'Loading' : 'Log In',
                // color: Color(0xFF5FDF83),
              );
            },
          ),
          const SizedBox(
            height: 110,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _socialIcon(FontAwesomeIcons.apple),
              _socialIcon(FontAwesomeIcons.google),
              _socialIcon(FontAwesomeIcons.twitter),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          SafeArea(
            top: false,
            child: TapButton(
              title: 'Create Account with Email',
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}

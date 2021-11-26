import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validators/form_validators.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/text_input_field.dart';
import '../../widgets/filled_button.dart';
import '../../widgets/tap_buttom.dart';
import '../cubit/signup_cubit.dart';

class SignUp extends StatelessWidget {
  final VoidCallback onTap;
  const SignUp({Key? key, required this.onTap}) : super(key: key);

  static final SignupCubit _signupCubit = SignupCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppLogo(),
        const SizedBox(
          height: 48,
        ),
        BlocBuilder<SignupCubit, SignupState>(
          bloc: _signupCubit,
          builder: (context, state) {
            final bool showError = state.name.invalid;
            final buttonTapped = state.buttonTapped;

            return TextInputField(
              hintText: 'Name',
              onChange: (value) {
                _signupCubit.onNameChange(value);
              },
              errorText: buttonTapped && showError
                  ? Name.showNameErrorMessage(state.name.error)
                  : null,
            );
          },
        ),
        const SizedBox(
          height: 48,
        ),
        BlocBuilder<SignupCubit, SignupState>(
          bloc: _signupCubit,
          builder: (context, state) {
            final bool showError = state.email.invalid;
            final buttonTapped = state.buttonTapped;

            return TextInputField(
              hintText: 'Email',
              onChange: (value) {
                _signupCubit.onEmailChange(value);
              },
              errorText: buttonTapped && showError
                  ? Email.showEmailErrorMessage(state.email.error)
                  : null,
            );
          },
        ),
        const SizedBox(
          height: 48,
        ),
        BlocBuilder<SignupCubit, SignupState>(
          bloc: _signupCubit,
          builder: (context, state) {
            final showError = state.password.invalid;
            final buttonTapped = state.buttonTapped;

            return TextInputField(
              hintText: 'Password',
              obscureText: true,
              onChange: (value) {
                _signupCubit.onPasswordChange(value);
              },
              errorText: buttonTapped && showError
                  ? Password.showPasswordErrorMessage(state.password.error)
                  : null,
            );
          },
        ),
        const SizedBox(
          height: 56,
        ),
        FilledButton(
          title: 'Create Account',
          onTap: () {
            _signupCubit.signUpWithEmailAndPassword();
          },
        ),
        const Expanded(child: SizedBox()),
        SafeArea(
          top: false,
          child: TapButton(
            title: 'Already have account',
            onTap: onTap,
          ),
        )
      ],
    );
  }
}

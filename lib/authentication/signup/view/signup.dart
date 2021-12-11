import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validators/form_validators.dart';
import 'package:formz/formz.dart';
import '../../../widgets/app_logo.dart';
import '../../../widgets/text_input_field.dart';
import '../../../widgets/filled_button.dart';
import '../../../widgets/tap_buttom.dart';
import '../cubit/signup_cubit.dart';
import '../../../widgets/flush_bar.dart';

class SignUp extends StatelessWidget {
  final VoidCallback onTap;
  const SignUp({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupCubit signupCubit = context.read<SignupCubit>();
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          showMessage(
            context: context,
            code: "Failed",
            icon: Icons.error_outline_rounded,
            message: 'Sign up failed',
          );
        } else if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: Column(
        children: [
          const AppLogo(),
          const SizedBox(
            height: 48,
          ),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              final bool showError = state.name.invalid;
              final buttonTapped = state.buttonTapped;

              return TextInputField(
                hintText: 'Name',
                onChange: (value) {
                  signupCubit.onNameChange(value);
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
            builder: (context, state) {
              final bool showError = state.email.invalid;
              final buttonTapped = state.buttonTapped;

              return TextInputField(
                hintText: 'Email',
                onChange: (value) {
                  signupCubit.onEmailChange(value);
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
            builder: (context, state) {
              final showError = state.password.invalid;
              final buttonTapped = state.buttonTapped;

              return TextInputField(
                hintText: 'Password',
                obscureText: true,
                onChange: (value) {
                  signupCubit.onPasswordChange(value);
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
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return FilledButton(
                title: state.status.isSubmissionInProgress
                    ? 'Loading...'
                    : 'Create Account',
                onTap: state.status.isSubmissionInProgress
                    ? null
                    : () {
                        signupCubit.signUpWithEmailAndPassword();
                      },
              );
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
      ),
    );
  }
}

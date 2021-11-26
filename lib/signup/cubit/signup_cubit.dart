import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_validators/form_validators.dart';
import 'package:formz/formz.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(const SignupState());

  void onNameChange(String value) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate([
          name,
          state.email,
          state.password,
        ]),
      ),
    );
  }

  void onEmailChange(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([
          state.name,
          email,
          state.password,
        ]),
      ),
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([
          state.name,
          state.email,
          password,
        ]),
      ),
    );
  }

  void signUpWithEmailAndPassword() async {
    if (!state.buttonTapped) {
      emit(state.copyWith(buttonTapped: true));
    }

    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    /// call firebase log in api
    await Future.delayed(const Duration(milliseconds: 400));
    emit(state.copyWith(status: FormzStatus.submissionSuccess));
  }
}

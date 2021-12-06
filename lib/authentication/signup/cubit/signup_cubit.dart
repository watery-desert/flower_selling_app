import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_validators/form_validators.dart';
import 'package:formz/formz.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthenticationRepository _authenticationRepository;

  SignupCubit({required AuthenticationRepository repository})
      : _authenticationRepository = repository,
        super(const SignupState());

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
    try {
      await _authenticationRepository.createUserWithEmail(
          email: state.email.value, password: state.password.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_validators/form_validators.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginCubit({required AuthenticationRepository repository})
      : _authenticationRepository = repository,
        super(const LoginState());

  void onEmailChange(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  void loginWithEmailAndPassword() async {
    if (!state.buttonTapped) {
      emit(state.copyWith(buttonTapped: true));
    }

    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithEmailAndPasswordFailure catch (_) {
      
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}

part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.buttonTapped = false,
  });
  final Email email;
  final Password password;
  final FormzStatus status;
  final bool buttonTapped;

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? buttonTapped,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      buttonTapped: buttonTapped ?? this.buttonTapped,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        status,
        buttonTapped,
      ];
}

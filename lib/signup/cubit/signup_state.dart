part of 'signup_cubit.dart';

class SignupState extends Equatable {
  const SignupState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.buttonTapped = false,
  });

  final Name name;
  final Email email;
  final Password password;
  final FormzStatus status;
  final bool buttonTapped;

  SignupState copyWith({
    Name? name,
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? buttonTapped,
  }) {
    return SignupState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      buttonTapped: buttonTapped ?? this.buttonTapped,
    );
  }

  @override
  List<Object> get props => [
        name,
        email,
        password,
        status,
        buttonTapped,
      ];
}

part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}


class AuthenticationUserChanged extends AuthenticationEvent {
  const AuthenticationUserChanged(this.user);

  final AuthUser user;

  @override
  List<Object> get props => [user];
}

class AuthenticationSignOutRequested extends AuthenticationEvent {}
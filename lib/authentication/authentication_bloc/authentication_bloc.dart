import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
       super(const AuthenticationState.unknown()) {
    on<AuthenticationUserChanged>(_onUserChanged);
    on<AuthenticationSignOutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AuthenticationUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<AuthUser> _userSubscription;

  void _onUserChanged(
      AuthenticationUserChanged event, Emitter<AuthenticationState> emit) {
    emit(event.user != AuthUser.empty
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated());
  }

  void _onLogoutRequested(AuthenticationSignOutRequested event,
      Emitter<AuthenticationState> emit) {
    _authenticationRepository.signOut();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}




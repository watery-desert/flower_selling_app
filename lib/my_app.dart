import 'package:cart_repository/cart_repository.dart';

import 'package:flowers_repository/flowers_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home/home.dart';
import 'widgets/loading_widget.dart';
import 'onboarding/onboarding_screen.dart';
import 'theme/theme.dart';

import './authentication/authentication_bloc/authentication_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();
      
  static final AuthenticationBloc _authenticationBloc = AuthenticationBloc(
    authenticationRepository: AuthenticationRepository(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _authenticationBloc,
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => _authenticationRepository,
          ),
          RepositoryProvider(
            create: (context) => FlowersRepo(),
          ),
          RepositoryProvider(
            create: (context) => CartRepo(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, bool>(
          // bloc: ThemeCubit(),
          builder: (context, state) {
            final bool isLight = state;
            return MaterialApp(
              title: 'Flutter Demo',
              theme: isLight ? lightTheme(context) : darkTheme(context),
              home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                // bloc: _authenticationBloc,
                builder: (BuildContext context, AuthenticationState state) {
                  if (state.status == AuthenticationStatus.unauthenticated) {
                    return const OnboardingScreen();
                  } else if (state.status ==
                      AuthenticationStatus.authenticated) {
                    return const Home();
                  }
                  return const LoadingWidget();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:app_hris/services/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/welcome/welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomeBloc, WelcomeState>(
      listener: (context, state) {
        if (state is WelcomeAuthenticatedState) {
          if (state.user.role == 1) {
            context.goNamed(AppRouteName.home);
          } else {
            context.goNamed(AppRouteName.home);
          }
        }

        if (state is WelcomeUnAuthenticatedState) {
          context.goNamed(AppRouteName.signin);
        }
      },
      child: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () => context.go(AppRouteName.signin),
            child: Image.asset(
              "assets/images/logo.png",
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}

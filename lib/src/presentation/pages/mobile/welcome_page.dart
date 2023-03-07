import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../services/app_route_name_mobile.dart';
import '../../bloc/welcome/welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomeBloc, WelcomeState>(
      listener: (context, state) {
        if (state is WelcomeAuthenticatedState) {
          if (state.user.role == 1) {
            context.go(AppRouteNameMobile.home);
          } else {
            context.go(AppRouteNameMobile.home);
          }
        }

        if (state is WelcomeUnAuthenticatedState) {
          context.goNamed(AppRouteNameMobile.signin);
        }
      },
      child: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () => context.go(AppRouteNameMobile.signin),
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

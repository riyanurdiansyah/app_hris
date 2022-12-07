import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/welcome/welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomeBloc, WelcomeState>(
      listener: (context, state) {
        if (state is WelcomeAuthenticatedState) {
          context.go("/main");
        }

        if (state is WelcomeUnAuthenticatedState) {
          context.go("/signin");
        }
      },
      child: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () => context.go("/signin"),
            child: const FlutterLogo(
              size: 125,
            ),
          ),
        ),
      ),
    );
  }
}

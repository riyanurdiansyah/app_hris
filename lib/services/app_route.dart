import 'package:app_hris/services/app_route_name.dart';
import 'package:app_hris/src/presentation/pages/attendance/attendance_page.dart';
import 'package:app_hris/src/presentation/pages/login_page.dart';
import 'package:app_hris/src/presentation/pages/main_page.dart';
import 'package:app_hris/src/presentation/pages/not_found_page.dart';
import 'package:app_hris/src/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

GoRouter router = GoRouter(
  errorBuilder: (context, state) => const NotFoundPage(),
  routes: <GoRoute>[
    GoRoute(
      path: '/welcome',
      name: 'welcome',
      builder: (context, state) {
        return const WelcomePage();
      },
    ),
    GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/',
      name: AppRouteName.home,
      builder: (context, state) {
        return const MainPage();
      },
      routes: [
        GoRoute(
          path: AppRouteName.attendance,
          name: AppRouteName.attendance,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
                context: context, state: state, child: const AttendancePage());
          },
        ),
      ],
    ),
  ],
  initialLocation: "/welcome",
  debugLogDiagnostics: true,
  routerNeglect: true,
  // urlPathStrategy: UrlPathStrategy.path,
);

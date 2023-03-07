import 'dart:io';

import 'package:app_hris/services/app_route_name.dart';
import 'package:app_hris/src/presentation/pages/mobile/attendance/attendance_page.dart';
import 'package:app_hris/src/presentation/pages/mobile/attendance/camera_page.dart';
import 'package:app_hris/src/presentation/pages/mobile/attendance/choose_attendance_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src/presentation/pages/mobile/login_page.dart';
import '../src/presentation/pages/mobile/main_page.dart';
import '../src/presentation/pages/mobile/not_found_page.dart';
import '../src/presentation/pages/mobile/welcome_page.dart';

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
                context: context,
                state: state,
                child: const ChooseAttendancePage());
          },
          routes: [
            GoRoute(
              path: AppRouteName.cameraClockin,
              name: AppRouteName.cameraClockin,
              // name: AppRouteName.attendance,
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const CameraPage(ket: "clockin"));
              },
            ),
            GoRoute(
              path: AppRouteName.cameraClockout,
              name: AppRouteName.cameraClockout,
              // name: AppRouteName.attendance,
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const CameraPage(ket: "clockout"));
              },
            ),
            GoRoute(
              path: AppRouteName.clockout,
              name: AppRouteName.clockout,
              pageBuilder: (context, state) {
                File? object = state.extra as File;
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: AttendancePage(
                    ket: "clockout",
                    imageFile: object,
                  ),
                );
              },
            ),
            GoRoute(
              path: AppRouteName.clockin,
              name: AppRouteName.clockin,
              pageBuilder: (context, state) {
                File? object = state.extra as File;
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: AttendancePage(
                    ket: "clockin",
                    imageFile: object,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
  initialLocation: "/welcome",
  debugLogDiagnostics: true,
  routerNeglect: true,
  // urlPathStrategy: UrlPathStrategy.path,
);

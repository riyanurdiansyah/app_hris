import 'dart:io';

import 'package:app_hris/services/app_route_name.dart';
import 'package:app_hris/src/presentation/pages/attendance/attendance_page.dart';
import 'package:app_hris/src/presentation/pages/attendance/camera_page.dart';
import 'package:app_hris/src/presentation/pages/attendance/choose_attendance_page.dart';
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
              // name: AppRouteName.attendance,
              pageBuilder: (context, state) {
                Object? object = state.extra;
                if (object != null && object is File) {
                  return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: AttendancePage(
                      ket: "clockout",
                      imageFile: object,
                    ),
                  );
                }
                return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: AttendancePage(ket: "clockout"));
              },
            ),
            GoRoute(
              path: AppRouteName.clockin,
              name: AppRouteName.clockin,
              // name: AppRouteName.attendance,
              pageBuilder: (context, state) {
                Object? object = state.extra;
                if (object != null && object is File) {
                  return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: AttendancePage(
                      ket: "clockin",
                      imageFile: object,
                    ),
                  );
                }
                return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: AttendancePage(ket: "clockin"));
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

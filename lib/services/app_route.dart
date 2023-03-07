import 'dart:io';

import 'package:app_hris/src/presentation/pages/mobile/attendance/attendance_page.dart';
import 'package:app_hris/src/presentation/pages/mobile/attendance/camera_page.dart';
import 'package:app_hris/src/presentation/pages/mobile/attendance/choose_attendance_page.dart';
import 'package:app_hris/src/presentation/pages/web/auth/web_login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src/presentation/pages/mobile/login_page.dart';
import '../src/presentation/pages/mobile/main_page.dart';
import '../src/presentation/pages/mobile/not_found_page.dart';
import '../src/presentation/pages/mobile/welcome_page.dart';
import 'app_route_name_mobile.dart';

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
        if (kIsWeb) {
          return const WebLoginPage();
        }
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/',
      name: AppRouteNameMobile.home,
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition(
            context: context, state: state, child: const MainPage());
      },
      routes: [
        GoRoute(
          path: AppRouteNameMobile.attendance,
          name: AppRouteNameMobile.attendance,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const ChooseAttendancePage());
          },
          routes: [
            GoRoute(
              path: AppRouteNameMobile.cameraClockin,
              name: AppRouteNameMobile.cameraClockin,
              // name: AppRouteNameMobile.attendance,
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const CameraPage(ket: "clockin"));
              },
            ),
            GoRoute(
              path: AppRouteNameMobile.cameraClockout,
              name: AppRouteNameMobile.cameraClockout,
              // name: AppRouteNameMobile.attendance,
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const CameraPage(ket: "clockout"));
              },
            ),
            GoRoute(
              path: AppRouteNameMobile.clockout,
              name: AppRouteNameMobile.clockout,
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
              path: AppRouteNameMobile.clockin,
              name: AppRouteNameMobile.clockin,
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

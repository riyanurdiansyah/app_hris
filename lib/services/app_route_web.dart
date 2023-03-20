import 'package:app_hris/services/app_route_name_mobile.dart';
import 'package:app_hris/src/presentation/pages/web/dashboard/attendance/web_attendance_page.dart';
import 'package:app_hris/src/presentation/pages/web/dashboard/blast/web_blast_page.dart';
import 'package:app_hris/src/presentation/pages/web/dashboard/profile/web_profile_page.dart';
import 'package:app_hris/src/presentation/pages/web/dashboard/web_dashboard_page.dart';
import 'package:app_hris/src/presentation/pages/web/dashboard/web_home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src/presentation/pages/mobile/not_found_page.dart';
import '../src/presentation/pages/mobile/welcome_page.dart';
import '../src/presentation/pages/web/auth/web_login_page.dart';
import '../src/presentation/pages/web/dashboard/request/web_request_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

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

GoRouter routerWeb = GoRouter(
  errorBuilder: (context, state) => const NotFoundPage(),
  navigatorKey: rootNavigatorKey,
  routes: [
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
        return const WebLoginPage();
      },
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      pageBuilder: ((context, state, child) {
        return NoTransitionPage(
          child: WebDashboardPage(
            route: state.location,
            widget: child,
          ),
        );
      }),
      routes: [
        GoRoute(
          path: '/',
          name: "/",
          pageBuilder: (context, state) {
            return NoTransitionPage(
                child: Container(
              color: Colors.red,
            ));
          },
          routes: [
            GoRoute(
              path: AppRouteNameMobile.home,
              name: AppRouteNameMobile.home,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: WebHomePage(),
                );
              },
            ),
            GoRoute(
              path: AppRouteNameMobile.attendance,
              name: AppRouteNameMobile.attendance,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: WebAttendancePage());
              },
            ),
            GoRoute(
              path: AppRouteNameMobile.request,
              name: AppRouteNameMobile.request,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: WebRequestPage());
              },
            ),
            GoRoute(
              path: AppRouteNameMobile.profile,
              name: AppRouteNameMobile.profile,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: WebProfilePage());
              },
            ),
            GoRoute(
              path: AppRouteNameMobile.blast,
              name: AppRouteNameMobile.blast,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: WebBlastPage());
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

import 'package:app_hris/services/app_route_name.dart';
import 'package:app_hris/src/presentation/pages/login_page.dart';
import 'package:app_hris/src/presentation/pages/main_page.dart';
import 'package:app_hris/src/presentation/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
        path: '/',
        builder: (context, state) {
          return const WelcomePage();
        },
        routes: [
          GoRoute(
            path: 'signin',
            builder: (context, state) {
              return const LoginPage();
            },
          ),
          GoRoute(
            path: 'main',
            name: AppRouteName.main,
            builder: (context, state) {
              return const MainPage();
            },
          ),
        ]),
  ],
  initialLocation: "/",
  debugLogDiagnostics: true,
  routerNeglect: true,
  // urlPathStrategy: UrlPathStrategy.path,
);

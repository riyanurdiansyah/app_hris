import 'package:app_hris/src/presentation/bloc/welcome/welcome_bloc.dart';
import 'package:app_hris/src/presentation/cubit/navbar/navbar_cubit.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'services/app_route.dart';
import 'services/app_route_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  // await EasyLocalization.ensureInitialized();
  // runApp(
  //   EasyLocalization(
  //     supportedLocales: const [
  //       Locale('en', 'US'),
  //       Locale('id', 'ID'),
  //     ],
  //     path: 'assets/languages',
  //     child: const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeBloc>(
          create: (_) => WelcomeBloc()..add(WelcomeCheckAuthenticationEvent()),
        ),
        BlocProvider<NavbarCubit>(
          create: (_) => NavbarCubit(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
          ),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryColor: const Color.fromARGB(198, 1, 249, 63),
        ),
        routeInformationParser: kIsWeb
            ? routerWeb.routeInformationParser
            : router.routeInformationParser,
        routeInformationProvider: kIsWeb
            ? routerWeb.routeInformationProvider
            : router.routeInformationProvider,
        routerDelegate:
            kIsWeb ? routerWeb.routerDelegate : router.routerDelegate,
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: "HRIS",
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

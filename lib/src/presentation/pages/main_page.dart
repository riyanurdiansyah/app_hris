import 'package:app_hris/src/presentation/bloc/home/home_bloc.dart';
import 'package:app_hris/src/presentation/cubit/navbar/navbar_cubit.dart';
import 'package:app_hris/src/presentation/pages/akun_page.dart';
import 'package:app_hris/src/presentation/pages/grafik_page.dart';
import 'package:app_hris/src/presentation/pages/home_page.dart';
import 'package:app_hris/src/presentation/pages/inbox_page.dart';
import 'package:app_hris/src/presentation/pages/news_page.dart';
import 'package:app_hris/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(HomeGetMenuEvent());
    _homeBloc.add(HomeGetTasksEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavbarCubit>(
          create: (_) => NavbarCubit(),
        ),
        BlocProvider<HomeBloc>(
          create: (_) => _homeBloc,
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<NavbarCubit, NavbarState>(
          builder: (context, state) => IndexedStack(
            index: state.index,
            children: const [
              HomePage(),
              NewsPage(),
              InboxPage(),
              GrafikPage(),
              AkunPage(),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<NavbarCubit, NavbarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.index,
              iconSize: 22,
              onTap: (i) =>
                  BlocProvider.of<NavbarCubit>(context).getNavBarItem(i),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: colorPrimaryDark,
              unselectedItemColor: colorSecondaryDark,
              elevation: 8,
              selectedFontSize: 14,
              unselectedFontSize: 12.5,
              selectedLabelStyle: GoogleFonts.poppins(
                height: 1.8,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                height: 1.8,
                fontWeight: FontWeight.w500,
              ),
              selectedIconTheme: const IconThemeData(
                size: 24,
              ),
              unselectedIconTheme: const IconThemeData(
                size: 20,
              ),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    CupertinoIcons.house_fill,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "News",
                  icon: Icon(
                    CupertinoIcons.news_solid,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Inbox",
                  icon: Icon(
                    Icons.email_rounded,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Grafik",
                  icon: Icon(
                    CupertinoIcons.chart_bar_square,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Akun",
                  icon: Icon(
                    CupertinoIcons.person_solid,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

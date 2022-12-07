import 'package:app_hris/src/presentation/bloc/main/main_bloc.dart';
import 'package:app_hris/src/presentation/cubit/navbar/navbar_cubit.dart';
import 'package:app_hris/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(create: (_) => MainBloc()),
        BlocProvider<NavbarCubit>(create: (_) => NavbarCubit()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<NavbarCubit, NavbarState>(
          builder: (context, state) => IndexedStack(
            index: state.index,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<NavbarCubit, NavbarState>(
          builder: (context, state) {
            return Card(
              elevation: 8,
              margin: EdgeInsets.zero,
              child: BottomNavigationBar(
                currentIndex: state.index,
                iconSize: 26,
                onTap: (i) =>
                    BlocProvider.of<NavbarCubit>(context).getNavBarItem(i),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: colorPrimaryDark,
                unselectedItemColor: colorSecondaryDark,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: "",
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.house,
                          size: 20,
                        ),
                        if (state.index == 0)
                          const SizedBox(
                            height: 8,
                          ),
                        if (state.index == 0)
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorPrimaryDark,
                            ),
                          )
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Card(
                      elevation: 5,
                      child: Container(
                        alignment: Alignment.center,
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: colorPrimaryDark,
                        ),
                        child: const FaIcon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidUser,
                          size: 20,
                        ),
                        if (state.index == 2)
                          const SizedBox(
                            height: 8,
                          ),
                        if (state.index == 2)
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorPrimaryDark,
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

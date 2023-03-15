import 'package:app_hris/src/presentation/pages/web/dashboard/widgets/web_header.dart';
import 'package:app_hris/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home/home_bloc.dart';
import 'home/widgets/web_last_activity_home_card.dart';
import 'home/widgets/web_rekap_home_card.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  final _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => _homeBloc,
      child: Scaffold(
        backgroundColor: backgroundGrey,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const WebHeader(),
                const SizedBox(
                  height: 25,
                ),
                WebRekapHomeCard(),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    debugPrint("CEK : ${state.isShowHadirToday}");
                    if (state.isShowHadirToday == true) {
                      return Container(
                        height: 200,
                        width: 300,
                        color: Colors.red,
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                const WebLastActivityHomeCard(),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

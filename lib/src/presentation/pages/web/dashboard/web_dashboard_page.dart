import 'package:app_hris/src/presentation/pages/web/dashboard/widgets/side_navbar.dart';
import 'package:app_hris/utils/app_color.dart';
import 'package:app_hris/utils/app_constanta_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebDashboardPage extends StatelessWidget {
  const WebDashboardPage({
    super.key,
    required this.widget,
    required this.route,
  });

  final Widget widget;
  final String route;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final router = GoRouter.of(context);
    return Scaffold(
      backgroundColor: backgroundGrey.withOpacity(0.4),
      drawer: SideNavbar(
        listMenu: listSidebar,
        route: route,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: backgroundGrey,
              child: SideNavbar(
                listMenu: listSidebar,
                route: route,
              ),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     color: Colors.red,
          //     child: Column(
          //       children: [

          //         Expanded(
          //           child: Container(
          //             height: size.height * 0.8,
          //             margin: const EdgeInsets.only(top: 20),
          //             color: backgroundGrey.withOpacity(0.4),
          //             width: double.infinity,
          //             child: SideNavbar(
          //               listMenu: listSidebar,
          //               route: route,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 5,
            child: widget,
          ),
        ],
      ),
    );
  }
}

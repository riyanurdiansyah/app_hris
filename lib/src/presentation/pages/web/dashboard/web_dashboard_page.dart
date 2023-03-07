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
      drawer: SideNavbar(
        listMenu: listSidebar,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 8,
                  child: const Center(
                    child: Text("ADMIN"),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    color: colorPrimary,
                    width: double.infinity,
                    child: SideNavbar(
                      listMenu: listSidebar,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: widget,
          ),
        ],
      ),
    );
  }
}

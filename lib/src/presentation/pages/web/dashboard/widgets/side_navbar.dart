import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../domain/entities/side_navbar_entity.dart';

class SideNavbar extends StatelessWidget {
  const SideNavbar({
    super.key,
    required this.listMenu,
  });

  final List<SideNavbarEntity> listMenu;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: List.generate(
            listMenu.length,
            (index) => SizedBox(
              width: double.infinity,
              child: InkWell(
                onHover: (val) {},
                overlayColor:
                    MaterialStateProperty.all(Colors.grey.withOpacity(0.4)),
                onTap: () {
                  router.goNamed(listMenu[index].route);
                },
                child: AnimatedContainer(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  duration: const Duration(
                    seconds: 1,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 60.0,
                  child: Row(
                    children: [
                      Image.asset(
                        listMenu[index].image,
                        width: 18,
                        color: Colors.black87,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        listMenu[index].title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

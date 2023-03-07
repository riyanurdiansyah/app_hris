import 'package:app_hris/utils/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/app_route_name_mobile.dart';
import '../../../../utils/app_url.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    GoRouter router = GoRouter.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Oooppss....",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colorPrimaryDark,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CachedNetworkImage(
                imageUrl: "$baseUrl/assets/images/ui/404.png",
                width: 225,
                errorWidget: (_, __, ___) => const SizedBox(),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Halaman tidak ditemukan",
                style: GoogleFonts.aBeeZee(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorPrimaryDark,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorPrimaryDark,
            ),
            onPressed: () => router.replaceNamed(AppRouteNameMobile.home),
            child: Text(
              "Kembali ke Home",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

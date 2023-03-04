import 'package:app_hris/services/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_color.dart';

class ChooseAttendancePage extends StatelessWidget {
  const ChooseAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 18),
        backgroundColor: colorPrimaryDark,
        elevation: 0,
        title: Text(
          "Attendance",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: colorPrimaryDark,
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              color: Colors.white,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: key,
        duration: const Duration(milliseconds: 500),
        distance: 60.0,
        type: ExpandableFabType.up,
        // fanAngle: 70,
        child: const Icon(Icons.dashboard_rounded),
        foregroundColor: Colors.white,
        backgroundColor: colorPrimaryDark,
        closeButtonStyle: ExpandableFabCloseButtonStyle(
          child: const Icon(Icons.close_rounded),
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey.shade400,
        ),
        overlayStyle: ExpandableFabOverlayStyle(
          blur: 1,
        ),
        onOpen: () {
          // debugPrint('onOpen');
        },
        afterOpen: () {
          // debugPrint('afterOpen');
        },
        onClose: () {
          // debugPrint('onClose');
        },
        afterClose: () {
          // debugPrint('afterClose');
        },
        children: [
          Row(
            children: [
              Text(
                "Clock-Out",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: colorPrimaryDark,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              FloatingActionButton.small(
                backgroundColor: colorPrimaryDark.withOpacity(0.6),
                heroTag: null,
                child: const Icon(Icons.punch_clock),
                onPressed: () => router.pushNamed(AppRouteName.cameraClockout),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Clock-In",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: colorPrimaryDark,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              FloatingActionButton.small(
                backgroundColor: colorPrimaryDark,
                heroTag: null,
                child: const Icon(Icons.punch_clock),
                onPressed: () => router.pushNamed(AppRouteName.cameraClockin),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

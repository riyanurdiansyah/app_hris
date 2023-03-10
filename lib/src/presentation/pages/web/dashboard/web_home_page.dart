import 'package:app_hris/src/presentation/pages/web/dashboard/widgets/web_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const WebHeader(title: "Home"),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.red.shade100.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome back, Admin",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "You've learned 80% of yout goal this week! \nKeep it up and improve your result!",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -0,
            top: -150,
            child: Image.asset(
              "images/employee.png",
            ),
          ),
        ],
      ),
    );
  }
}

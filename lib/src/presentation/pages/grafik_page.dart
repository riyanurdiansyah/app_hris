import 'package:app_hris/src/presentation/pages/widgets/grafik_monthly.dart';
import 'package:app_hris/src/presentation/pages/widgets/grafik_weekly.dart';
import 'package:app_hris/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GrafikPage extends StatelessWidget {
  const GrafikPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorPrimaryDark,
      appBar: AppBar(
        backgroundColor: colorPrimaryDark,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Performa Kamu",
          style: GoogleFonts.poppins(
            fontSize: 14.5,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.55,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Overall Performance",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DefaultTabController(
                        length: 3,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              height: 36,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: colorSecondary,
                              ),
                              child: TabBar(
                                indicator: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                unselectedLabelColor: Colors.grey.shade600,
                                labelColor: Colors.red,
                                labelStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                ),
                                tabs: const [
                                  Tab(
                                    text: "Weekly",
                                  ),
                                  Tab(
                                    text: "Monthly",
                                  ),
                                  Tab(
                                    text: "All Time",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height / 2.6,
                              width: double.infinity,
                              child: TabBarView(
                                children: [
                                  const GrafikWeekly(),
                                  const GrafikMonthly(),
                                  Container(
                                    height: 60,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey.shade200,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rekap Hasil",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Lihat semua hasil rekap",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: colorSecondary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                                color: Colors.black54,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

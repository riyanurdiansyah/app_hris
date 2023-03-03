import 'dart:io';

import 'package:app_hris/src/presentation/pages/attendance/widgets/custom_slider_button.dart';
import 'package:app_hris/utils/app_color.dart';
import 'package:app_hris/utils/app_constanta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({
    super.key,
    required this.ket,
    this.imageFile,
  });

  final String ket;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final router = GoRouter.of(context);
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: colorPrimaryDark,
      //   centerTitle: true,
      //   title: Text(
      //     "Absen",
      //     style: GoogleFonts.poppins(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                maxZoom: 20,
                minZoom: 10,
                zoom: 18,
                center: LatLng(51.5090214, -0.1982948),
              ),
              nonRotatedChildren: [
                TileLayer(
                  urlTemplate: mapBoxUrl,
                  additionalOptions: const {
                    "access_token": mapBoxToken,
                    "id": mapBoxStyle,
                  },
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      PhysicalModel(
                        color: Colors.grey.shade200,
                        elevation: 8,
                        shadowColor: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          alignment: Alignment.center,
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () => router.pop(),
                            icon: const Icon(Icons.arrow_back_rounded),
                          ),
                        ),
                      ),
                      const Spacer(),
                      PhysicalModel(
                        color: Colors.grey.shade200,
                        elevation: 8,
                        shadowColor: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          alignment: Alignment.center,
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.gps_fixed_rounded,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 25,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      width: double.infinity,
                      height: size.height / 2.4,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/note.png",
                                width: 20,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Berikan Catatan",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "note: catatan jika memang diperlukan",
                              focusColor: Colors.grey,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/shutter.png",
                                width: 20,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Foto Anda",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              if (imageFile == null)
                                Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              if (imageFile != null)
                                Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey.shade300,
                                    image: DecorationImage(
                                      image: FileImage(imageFile!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              const SizedBox(
                                width: 14,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ukuran File : 12.25 Mb",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      padding: const EdgeInsets.all(6),
                                      child: Text(
                                        "retake",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomSlideAction(
                            outerColor: colorPrimaryDark,
                            innerColor: Colors.white,
                            elevation: 0,
                            height: 50,
                            sliderButtonIconSize: 15,
                            borderRadius: 16,
                            text: ket == "clockin"
                                ? "Slide To Clockin"
                                : "Slide To Clockout",
                            textStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            submittedIcon: Icon(
                              Icons.alarm_rounded,
                              color: colorPrimaryDark,
                            ),
                            onSubmit: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

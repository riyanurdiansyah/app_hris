import 'dart:io';

import 'package:app_hris/src/presentation/bloc/attendance/attendance_bloc.dart';
import 'package:app_hris/src/presentation/pages/attendance/widgets/custom_slider_button.dart';
import 'package:app_hris/utils/app_color.dart';
import 'package:app_hris/utils/app_constanta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import '../../../../services/app_route_name.dart';

class AttendancePage extends StatelessWidget {
  AttendancePage({
    super.key,
    required this.ket,
    this.imageFile,
  });

  final String ket;
  final File? imageFile;

  final _attendanceBloc = AttendanceBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final router = GoRouter.of(context);
    return BlocProvider<AttendanceBloc>(
      create: (_) => AttendanceBloc()..add(CheckPermissionEvent()),
      child: Scaffold(
        body: BlocListener<AttendanceBloc, AttendanceState>(
          listener: (context, state) {
            if (state is LocationDenyPermissionState) {
              router.pop();
            }
          },
          child: SizedBox(
            width: double.infinity,
            height: size.height,
            child: Stack(
              children: [
                BlocBuilder<AttendanceBloc, AttendanceState>(
                  builder: (context, state) {
                    if (state is LocationLoadedState) {
                      // return MapboxMap(
                      //   accessToken: mapBoxToken,
                      //   styleString: mapBoxStyle,
                      //   initialCameraPosition: CameraPosition(
                      //     target: LatLng(
                      //       state.position.latitude,
                      //       state.position.longitude,
                      //     ),
                      //   ),
                      // );
                      return FlutterMap(
                        mapController: _attendanceBloc.mapController,
                        options: MapOptions(
                          interactiveFlags: InteractiveFlag.rotate,
                          zoom: 18,
                          maxZoom: 18,
                          minZoom: 16,
                          center: LatLng(state.position.latitude,
                              state.position.longitude),
                        ),
                        nonRotatedChildren: [
                          TileLayer(
                            urlTemplate: mapBoxUrl,
                            additionalOptions: const {
                              "access_token": mapBoxToken,
                              "id": mapBoxStyle,
                            },
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                width: 50,
                                height: 50,
                                point: LatLng(state.position.latitude,
                                    state.position.longitude),
                                builder: (_) => Image.asset(
                                  "assets/images/user-location.png",
                                  width: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return Container(
                      color: Colors.grey.shade200,
                    );
                  },
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
                              child: IconButton(
                                onPressed: () =>
                                    _attendanceBloc.add(FocusLocationEvent()),
                                icon: const Icon(
                                  Icons.gps_fixed_rounded,
                                ),
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
                                  hintText:
                                      "note: catatan jika memang diperlukan",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ukuran File : ${_attendanceBloc.getFileSize(imageFile!.lengthSync(), 1)}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (ket == "clockin") {
                                            router.pushNamed(
                                                AppRouteName.cameraClockin);
                                          } else {
                                            router.pushNamed(
                                                AppRouteName.cameraClockout);
                                          }
                                        },
                                        child: Text(
                                          "Foto Ulang",
                                          style: GoogleFonts.poppins(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue,
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
                              const SizedBox(
                                height: 20,
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
        ),
      ),
    );
  }
}

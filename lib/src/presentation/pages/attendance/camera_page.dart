import 'dart:io';

import 'package:app_hris/services/app_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.ket});

  final String ket;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;

  Future initializeCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(cameras[1], ResolutionPreset.medium);
    await controller!.initialize();
  }

  Future<String?> findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      externalStorageDirPath = directory?.path;
    } else if (Platform.isIOS) {
      externalStorageDirPath = (await getApplicationDocumentsDirectory()).path;
    }
    return externalStorageDirPath;
  }

  Future<File?> takePicture() async {
    final path = await findLocalPath();
    // String directoryPath = "${root.path}/attendance_camera";
    // await Directory(path!).create(recursive: true);
    String filePath = "$path/${DateTime.now()}.jpg";

    try {
      await controller!.takePicture();
    } catch (e) {
      return null;
    }

    return File(filePath);
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: initializeCamera(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: CameraPreview(controller!),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 35),
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: () async {
                        if (!controller!.value.isTakingPicture) {
                          final res = await controller!.takePicture();

                          router.goNamed(widget.ket, extra: File(res.path));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}

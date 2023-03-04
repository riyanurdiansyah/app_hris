import 'dart:developer';

import 'package:app_hris/src/presentation/bloc/camera/camera_bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.ket});

  final String ket;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  final CameraBloc _cameraBloc = CameraBloc();
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _cameraBloc.add(CameraOnInitializeEvent());
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (!_cameraBloc.isInitialized()) return;

    if (state == AppLifecycleState.inactive) {
      _cameraBloc.add(CameraStoppedEvent());
    } else if (state == AppLifecycleState.resumed) {
      _cameraBloc.add(CameraOnInitializeEvent());
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final router = GoRouter.of(context);
    return BlocProvider<CameraBloc>(
      create: (_) => _cameraBloc,
      child: Scaffold(
        body: BlocConsumer<CameraBloc, CameraState>(
          listener: (context, state) {
            if (state is CameraCaptureSuccessState) {
              router.goNamed(widget.ket, extra: state.image);
            }
            if (state is CameraOnInitializeEvent) {
              log("ON INITIALIZE");
            }
            if (state is CameraInitial) {
              log("message");
            }

            if (state is CameraReadyState) {}
          },
          builder: (context, state) {
            if (state is CameraInitial || state is CameraFailureState) {
              return Container(
                color: Colors.white,
              );
            }

            return Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: CameraPreview(_cameraBloc.cameraController!),
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
                      onTap: () => _cameraBloc.add(CameraCapturedEvent()),
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
          },
        ),
      ),
    );
  }
}

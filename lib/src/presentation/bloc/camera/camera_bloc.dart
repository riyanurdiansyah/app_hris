import 'dart:developer';
import 'dart:io';
import 'package:app_hris/services/app_camera.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  late AppCameraService cameraService;
  CameraController? cameraController;
  CameraBloc() : super(CameraInitial()) {
    cameraService = AppCameraService();
    on<CameraOnInitializeEvent>(_onInitialize);
    on<CameraCapturedEvent>(_onCaptured);
  }

  bool isInitialized() => cameraController?.value.isInitialized ?? false;

  @override
  Future<void> close() {
    cameraController?.dispose();
    return super.close();
  }

  void _onInitialize(event, emit) async {
    try {
      cameraController = await cameraService.getCameraController(
          ResolutionPreset.medium, CameraLensDirection.front);
      await cameraController!.initialize();
      emit(CameraReadyState());
    } on CameraException catch (e) {
      log("ERROR CAMERA : ${e.toString()}");
      emit(CameraFailureState());
    } catch (e) {
      log("ERROR CAMERA : ${e.toString()}");
      emit(CameraFailureState());
    }
  }

  void _onCaptured(event, emit) async {
    if (!cameraController!.value.isTakingPicture) {
      final result = await cameraController!.takePicture();
      emit(CameraCaptureSuccessState(File(result.path)));
    } else {
      emit(CameraCaptureFailureState());
    }
  }
}

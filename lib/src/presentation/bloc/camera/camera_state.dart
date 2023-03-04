part of 'camera_bloc.dart';

class CameraState extends Equatable {
  const CameraState({
    this.imageFile,
    // this.isGrantedCamera,
    // this.cameraController,
  });

  final File? imageFile;
  // final bool? isGrantedCamera;
  // final CameraController? cameraController;

  @override
  List<Object> get props => [];

  CameraState copyWith({
    File? imageFile,
    // bool? isGrantedCamera,
    // CameraController? cameraController,
  }) {
    return CameraState(
      imageFile: imageFile ?? this.imageFile,
      // isGrantedCamera: isGrantedCamera ?? this.isGrantedCamera,
      // cameraController: cameraController ?? this.cameraController,
    );
  }
}

class CameraInitial extends CameraState {}

class CameraReadyState extends CameraState {}

class CameraFailureState extends CameraState {}

class CameraCaptureInProgressState extends CameraState {}

class CameraCaptureSuccessState extends CameraState {
  const CameraCaptureSuccessState(this.image);
  final File image;
}

class CameraCaptureFailureState extends CameraState {}

class CameraDisposeState extends CameraState {}

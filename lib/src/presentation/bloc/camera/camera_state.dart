part of 'camera_bloc.dart';

class CameraState extends Equatable {
  const CameraState({
    this.imageFile,
    this.isGrantedCamera,
    this.cameraController,
  });

  final File? imageFile;
  final bool? isGrantedCamera;
  final CameraController? cameraController;

  @override
  List<Object> get props => [];

  CameraState copyWith({
    File? imageFile,
    bool? isGrantedCamera,
    CameraController? cameraController,
  }) {
    return CameraState(
      imageFile: imageFile ?? this.imageFile,
      isGrantedCamera: isGrantedCamera ?? this.isGrantedCamera,
      cameraController: cameraController ?? this.cameraController,
    );
  }
}

class CameraInitial extends CameraState {}

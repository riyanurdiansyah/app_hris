part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}

class CameraOnRequestPermissionEvent extends CameraEvent {}

class CameraOnInitializeEvent extends CameraEvent {}

class CameraOnDisposeEvent extends CameraEvent {}

class CameraStoppedEvent extends CameraEvent {}

class CameraCapturedEvent extends CameraEvent {}

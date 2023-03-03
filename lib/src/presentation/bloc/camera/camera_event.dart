part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}

class CameraOnRequestPermission extends CameraEvent {}

class CameraOnInitialize extends CameraEvent {}

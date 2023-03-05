part of 'attendance_bloc.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class LocationLoadingState extends AttendanceState {}

class LocationLoadedState extends AttendanceState {
  const LocationLoadedState(this.position);

  final Position position;

  @override
  List<Object> get props => [position];
}

class LocationFailureState extends AttendanceState {}

class LocationDenyPermissionState extends AttendanceState {}

class SubmitAttendanceLoadingState extends AttendanceState {}

class SubmitAttendanceFailureState extends AttendanceState {
  final String errorMsg;

  const SubmitAttendanceFailureState(this.errorMsg);
}

class SubmitAttendanceSuccessState extends AttendanceState {}

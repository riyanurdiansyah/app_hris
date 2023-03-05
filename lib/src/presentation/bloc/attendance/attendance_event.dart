part of 'attendance_bloc.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class AttendanceInitializeEvent extends AttendanceEvent {}

class LoadLocationEvent extends AttendanceEvent {}

class UpdateLocationEvent extends AttendanceEvent {
  const UpdateLocationEvent(this.position);

  final UserLocationEntity position;

  @override
  List<Object> get props => [position];
}

class CheckPermissionEvent extends AttendanceEvent {}

class FocusLocationEvent extends AttendanceEvent {}

class OnSubmitAttendance extends AttendanceEvent {
  final File image;
  final String notes;
  final String kode;
  final double latitude;
  final double longitude;

  const OnSubmitAttendance(
      this.image, this.notes, this.kode, this.latitude, this.longitude);
}

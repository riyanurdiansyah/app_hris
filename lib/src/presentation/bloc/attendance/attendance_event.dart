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

  final Position position;

  @override
  List<Object> get props => [position];
}

class CheckPermissionEvent extends AttendanceEvent {}

class FocusLocationEvent extends AttendanceEvent {}

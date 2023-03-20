import 'package:equatable/equatable.dart';

class RekapAttendanceEntity extends Equatable {
  const RekapAttendanceEntity({
    required this.message,
    required this.data,
  });

  final String message;
  final List<UserRekapAttendanceEntity> data;

  @override
  List<Object?> get props => [message, data];
}

class UserRekapAttendanceEntity extends Equatable {
  const UserRekapAttendanceEntity({
    required this.userId,
    required this.userName,
    required this.userAbsensi,
  });

  final String userId;
  final String userName;
  final List<AbsenRekapAttendanceEntity> userAbsensi;

  @override
  List<Object?> get props => [userId, userName, userAbsensi];
}

class AbsenRekapAttendanceEntity extends Equatable {
  const AbsenRekapAttendanceEntity({
    required this.clockin,
    required this.clockout,
    required this.noteClockin,
    required this.noteClockout,
  });

  final String clockin;
  final String clockout;
  final String noteClockin;
  final String noteClockout;

  @override
  List<Object?> get props => [clockin, clockout, noteClockin, noteClockout];
}

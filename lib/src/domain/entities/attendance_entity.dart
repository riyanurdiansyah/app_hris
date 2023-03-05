class AttendanceResponseEntity {
  AttendanceResponseEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final bool status;
  final String message;
  final AttendanceDataEntity data;
}

class AttendanceDataEntity {
  AttendanceDataEntity({
    required this.userId,
    required this.timeClockin,
    required this.timeClockout,
    required this.imageClockin,
    required this.imageClockout,
    required this.latitudeClockin,
    required this.latitudeClockout,
    required this.longitudeClockin,
    required this.longitudeClockout,
    required this.noteClockin,
    required this.noteClockout,
  });

  final String userId;
  final String timeClockin;
  final String timeClockout;
  final String imageClockin;
  final String imageClockout;
  final double latitudeClockin;
  final double latitudeClockout;
  final double longitudeClockin;
  final int longitudeClockout;
  final String noteClockin;
  final String noteClockout;
}

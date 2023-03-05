import '../../domain/entities/attendance_entity.dart';

class AttendanceResponseDTO {
  AttendanceResponseDTO({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final bool status;
  final String message;
  final AttendanceDataDTO data;

  factory AttendanceResponseDTO.fromJson(Map<String, dynamic> json) =>
      AttendanceResponseDTO(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: AttendanceDataDTO.fromJson(json["data"]),
      );

  AttendanceResponseEntity convertToEntity(AttendanceResponseDTO data) =>
      AttendanceResponseEntity(
        code: data.code,
        status: data.status,
        message: data.message,
        data: data.data.convertToEntity(data.data),
      );
}

class AttendanceDataDTO {
  AttendanceDataDTO({
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

  AttendanceDataEntity convertToEntity(AttendanceDataDTO data) =>
      AttendanceDataEntity(
        userId: data.userId,
        timeClockin: data.timeClockin,
        timeClockout: data.timeClockout,
        imageClockin: data.imageClockin,
        imageClockout: data.imageClockout,
        latitudeClockin: data.latitudeClockin,
        latitudeClockout: data.latitudeClockout,
        longitudeClockin: data.longitudeClockin,
        longitudeClockout: data.longitudeClockout,
        noteClockin: data.noteClockin,
        noteClockout: data.noteClockout,
      );

  factory AttendanceDataDTO.fromJson(Map<String, dynamic> json) =>
      AttendanceDataDTO(
        userId: json["user_id"],
        timeClockin: json["time_clockin"],
        timeClockout: json["time_clockout"],
        imageClockin: json["image_clockin"],
        imageClockout: json["image_clockout"],
        latitudeClockin: json["latitude_clockin"].toDouble(),
        latitudeClockout: json["latitude_clockout"].toDouble(),
        longitudeClockin: json["longitude_clockin"].toDouble(),
        longitudeClockout: json["longitude_clockout"],
        noteClockin: json["note_clockin"],
        noteClockout: json["note_clockout"],
      );
}

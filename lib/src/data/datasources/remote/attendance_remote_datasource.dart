import 'package:app_hris/src/data/dto/attendance_dto.dart';

abstract class AttendanceRemoteDataSource {
  Future<AttendanceResponseDTO> attendance(
      String uid, Map<String, dynamic> data);
}

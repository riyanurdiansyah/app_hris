import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/domain/entities/attendance_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, AttendanceResponseEntity>> attendance(
      String uid, Map<String, dynamic> data);
}

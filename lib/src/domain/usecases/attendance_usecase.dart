import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/domain/entities/attendance_entity.dart';
import 'package:app_hris/src/domain/repositories/attendance_repository.dart';
import 'package:dartz/dartz.dart';

class AttendanceUseCase {
  final AttendanceRepository _repository;

  AttendanceUseCase(this._repository);

  Future<Either<Failure, AttendanceResponseEntity>> attendance(
          String uid, Map<String, dynamic> data) async =>
      await _repository.attendance(uid, data);
}

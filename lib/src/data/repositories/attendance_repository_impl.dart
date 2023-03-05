import 'package:app_hris/src/data/datasources/remote/attendance_remote_datasource.dart';
import 'package:app_hris/src/domain/entities/attendance_entity.dart';
import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/domain/repositories/attendance_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/exception_handling.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource _datasource;
  AttendanceRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, AttendanceResponseEntity>> attendance(
      String uid, Map<String, dynamic> data) async {
    try {
      final response = await _datasource.attendance(uid, data);
      final convertToEntity = response.convertToEntity(response);
      return Right(convertToEntity);
    } catch (e) {
      return Left(ExceptionHandleRepository().execute(e));
    }
  }
}

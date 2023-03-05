import 'dart:developer';

import 'package:app_hris/src/core/interceptor.dart';
import 'package:app_hris/src/data/datasources/remote/attendance_remote_datasource.dart';
import 'package:app_hris/src/data/dto/attendance_dto.dart';
import 'package:app_hris/utils/app_url.dart';
import 'package:dio/dio.dart';

import '../../../core/dio_option.dart';
import '../../../core/exception_handling.dart';

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  late Dio dio;

  AttendanceRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<AttendanceResponseDTO> attendance(
      String uid, Map<String, dynamic> data) async {
    var formData = FormData.fromMap(data);
    await dioInterceptor(dio);
    final response = await dio.post(
      attendanceUrl,
      options: dioOption(),
      data: formData,
    );
    log("RESPONSE ATTENDANCE: $data");
    log("RESPONSE ATTENDANCE: ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return AttendanceResponseDTO.fromJson(response.data);
    }
    return ExceptionHandleDataSource.execute(
      code,
      response,
      'Error Login... failed connect to server',
    );
  }
}

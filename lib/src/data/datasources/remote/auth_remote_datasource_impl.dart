import 'dart:developer';

import 'package:app_hris/src/core/exception_handling.dart';
import 'package:app_hris/src/data/datasources/remote/auth_remote_datasource.dart';
import 'package:app_hris/src/data/dto/user_dto.dart';
import 'package:app_hris/utils/app_url.dart';
import 'package:dio/dio.dart';

import '../../../core/dio_option.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  late Dio dio;
  AuthRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<UserDTO> login(String email, String password) async {
    final response = await dio.post(
      signinUrl,
      data: {
        "email": email,
        "password": password,
      },
      options: dioOption(),
    );
    log("RES : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return UserDTO.fromJson(response.data);
    }
    return ExceptionHandleDataSource.execute(
      code,
      response,
      'Error Login... failed connect to server',
    );
  }
}

import 'dart:developer';

import 'package:app_hris/src/core/interceptor.dart';
import 'package:app_hris/src/data/datasources/remote/home_remote_datasource.dart';
import 'package:app_hris/src/data/dto/menu_dto.dart';
import 'package:app_hris/src/data/dto/task_dto.dart';
import 'package:app_hris/utils/app_url.dart';
import 'package:dio/dio.dart';

import '../../../core/dio_option.dart';
import '../../../core/exception_handling.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  late Dio dio;
  HomeRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<MenuDTO> getMenu(String token) async {
    await dioInterceptor(dio, token);
    final response = await dio.get(
      menuUrl,
      options: dioOption(),
    );
    log("RESPONSE GET MENU : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return MenuDTO.fromJson(response.data);
    }
    return ExceptionHandleDataSource.execute(
      code,
      response,
      'Error Get Menu... failed connect to server',
    );
  }

  @override
  Future<TaskDTO> getTaskById(String token, String uuid) async {
    await dioInterceptor(dio, token);
    final response = await dio.get(
      "$taskByIdUrl/$uuid",
      options: dioOption(),
    );
    log("RESPONSE GET TASK BY ID : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return TaskDTO.fromJson(response.data);
    }
    return ExceptionHandleDataSource.execute(
      code,
      response,
      'Error Get Task By Id... failed connect to server',
    );
  }
}

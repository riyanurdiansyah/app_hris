import 'package:app_hris/src/core/dio_option.dart';
import 'package:app_hris/src/core/interceptor.dart';
import 'package:app_hris/src/data/datasources/remote/blast_remote_datasource.dart';
import 'package:app_hris/utils/app_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BlastRemoteDataSourceImpl implements BlastRemoteDataSource {
  late Dio dio;
  BlastRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }
  @override
  Future<bool> sendMessage(String token, Map<String, dynamic> body) async {
    debugPrint("TOKEN : $token");
    debugPrint("BODY : $body");
    await dioInterceptorWA(dio, token);
    final response = await dio.post(
      messageWaUrl,
      data: body,
      options: dioOption(),
    );
    debugPrint("RESPONSE SEND MESSAGE : ${response.data}");
    return true;
  }
}

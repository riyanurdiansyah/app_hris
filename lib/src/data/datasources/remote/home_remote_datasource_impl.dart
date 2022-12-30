import 'package:app_hris/src/data/datasources/remote/home_remote_datasource.dart';
import 'package:app_hris/src/data/dto/menu_dto.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  late Dio dio;
  late SharedPreferences prefs;
  AuthRemoteDataSourceImpl({Dio? dio}) async {
    this.dio = dio ?? Dio();
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<MenuDTO> getMenu() async {
    throw (UnimplementedError);
    // final response = await dio.post(
    //   signinUrl,
    //   data: {
    //     "email": email,
    //     "password": password,
    //   },
    //   options: dioOption(),
    // );
    // int code = response.statusCode ?? 500;
    // if (code == 200) {
    //   return UserDTO.fromJson(response.data);
    // }
    // return ExceptionHandleDataSource.execute(
    //   code,
    //   response,
    //   'Error Check Status Order... failed connect to server',
    // );
  }
}

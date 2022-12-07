import 'package:app_hris/src/data/dto/user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<UserDTO> login(String email, String password);
}

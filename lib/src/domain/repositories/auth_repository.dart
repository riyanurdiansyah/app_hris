import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
}

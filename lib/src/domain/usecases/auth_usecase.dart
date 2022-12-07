import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/domain/entities/user_entity.dart';
import 'package:app_hris/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthUseCase {
  final AuthRepository _repository;

  AuthUseCase(this._repository);

  Future<Either<Failure, UserEntity>> login(
          String email, String password) async =>
      await _repository.login(email, password);
}

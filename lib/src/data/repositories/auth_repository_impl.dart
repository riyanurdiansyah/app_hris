import 'package:app_hris/src/core/exception_handling.dart';
import 'package:app_hris/src/data/datasources/remote/auth_remote_datasource.dart';
import 'package:app_hris/src/domain/entities/user_entity.dart';
import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _datasource;
  AuthRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      return Right(await _datasource.login(email, password));
    } catch (e) {
      return Left(ExceptionHandleRepository().execute(e));
    }
  }
}

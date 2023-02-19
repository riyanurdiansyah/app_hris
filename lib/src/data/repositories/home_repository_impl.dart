import 'package:app_hris/src/data/datasources/remote/home_remote_datasource.dart';
import 'package:app_hris/src/domain/entities/menu_entity.dart';
import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/domain/entities/task_entity.dart';
import 'package:app_hris/src/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/exception_handling.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _datasource;
  HomeRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, MenuEntity>> getMenu(String token) async {
    try {
      return Right(await _datasource.getMenu(token));
    } catch (e) {
      return Left(ExceptionHandleRepository().execute(e));
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(
      String token, String uuid) async {
    try {
      return Right(await _datasource.getTaskById(token, uuid));
    } catch (e) {
      return Left(ExceptionHandleRepository().execute(e));
    }
  }
}

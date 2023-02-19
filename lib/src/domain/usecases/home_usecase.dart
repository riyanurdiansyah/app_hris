import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/domain/entities/menu_entity.dart';
import 'package:app_hris/src/domain/entities/task_entity.dart';
import 'package:app_hris/src/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase {
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  Future<Either<Failure, MenuEntity>> getMenu(String token) async =>
      await _repository.getMenu(token);

  Future<Either<Failure, TaskEntity>> getTaskById(
          String token, String uuid) async =>
      await _repository.getTaskById(token, uuid);
}

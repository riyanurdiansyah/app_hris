import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/domain/entities/menu_entity.dart';
import 'package:app_hris/src/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, MenuEntity>> getMenu(String token);

  Future<Either<Failure, TaskEntity>> getTaskById(String token, String uuid);
}

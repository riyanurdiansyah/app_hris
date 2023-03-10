import 'dart:developer';

import 'package:app_hris/src/core/exception_handling.dart';
import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/data/datasources/remote/blast_remote_datasource.dart';
import 'package:app_hris/src/domain/repositories/blast_repository.dart';
import 'package:dartz/dartz.dart';

class BlastRepositoryImpl implements BlastRepository {
  final BlastRemoteDataSource _datasource;
  BlastRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, bool>> sendMessage(
      String token, Map<String, dynamic> body) async {
    try {
      final response = await _datasource.sendMessage(token, body);
      return Right(response);
    } catch (e) {
      log("ERROR SEND MESSAGE : ${e.toString()}");
      return Left(ExceptionHandleRepository().execute(e));
    }
  }
}

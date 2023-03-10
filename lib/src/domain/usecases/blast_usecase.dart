import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/domain/repositories/blast_repository.dart';
import 'package:dartz/dartz.dart';

class BlastUseCase {
  final BlastRepository _repository;

  BlastUseCase(this._repository);

  Future<Either<Failure, bool>> sendMessage(
          String token, Map<String, dynamic> body) async =>
      await _repository.sendMessage(token, body);
}

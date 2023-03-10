import 'package:app_hris/src/core/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BlastRepository {
  Future<Either<Failure, bool>> sendMessage(
      String token, Map<String, dynamic> body);
}

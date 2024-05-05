import 'package:dartz/dartz.dart';

import 'package:social_app/core/error/failure.dart';

import 'package:social_app/features/register/data/models/register_request.dart';

import '../../domain/repositories/register_repository.dart';
import '../data_sources/register_data_source.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDataSource _registerDataSource = RegisterDataSource();

  @override
  Future<Either<Failure, void>> register(
      RegisterRequest registerRequest) async {
    try {
      await _registerDataSource.register(registerRequest);
      return const Right(null);
    } catch (e) {
      return Left(Failure());
    }
  }
}

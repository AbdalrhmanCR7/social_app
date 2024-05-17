import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import 'package:social_app/core/error/failure.dart';

import 'package:social_app/features/register/data/models/register_request.dart';

import '../../../../app/data/data_source/app_local_data_source.dart';
import '../../domain/repositories/register_repository.dart';
import '../data_sources/register_data_source.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDataSource _registerDataSource = RegisterDataSource();
  final AppLocalDataSource _appLocalDataSource = AppLocalDataSourceImpl();

  @override
  Future<Either<Failure, void>> register(
      RegisterRequest registerRequest) async {
    try {
      await _registerDataSource.register(registerRequest);
      await _appLocalDataSource.setUserLoggedInStatus(true);
      return const Right(null);
    } catch (e) {
      debugPrint('Register Error: $e');
      throw Exception(e);
    }
  }
}

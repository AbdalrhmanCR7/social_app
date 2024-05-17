import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import 'package:social_app/core/error/failure.dart';

import 'package:social_app/features/register/data/models/register_request.dart';

import '../../../../app/data/data_source/app_local_data_source.dart';
import '../../domain/repositories/register_repository.dart';
import '../data_sources/register_data_source.dart';
import '../models/user_model.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDataSource _registerDataSource = RegisterDataSource();
  final AppLocalDataSource _appLocalDataSource = AppLocalDataSource();

  @override
  Future<Either<Failure, void>> register(
      RegisterRequest registerRequest) async {
    try {
      final UserModel user =
          await _registerDataSource.register(registerRequest);
      await _appLocalDataSource.setUserLoggedInStatus(true);
      await _appLocalDataSource.setUserId(user.id);
      return const Right(null);
    } catch (e) {
      debugPrint('Register Error: $e');
      throw Exception(e);
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:social_app/core/error/failure.dart';

import 'package:social_app/features/login/data/models/login_request.dart';

import '../../../../app/data/data_source/app_local_data_source.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_remote_data_source.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource = LoginRemoteDataSource();
  final AppLocalDataSource _appLocalDataSource = AppLocalDataSource();

  @override
  Future<Either<Failure, void>> login(LoginRequest loginRequest) async {
    try {
      await _loginRemoteDataSource.login(loginRequest);
      await _appLocalDataSource.setUserLoggedInStatus(true);
      return const Right(null);
    } catch (e) {
      debugPrint('Login Error: $e');
      throw Exception(e);
    }
  }
}

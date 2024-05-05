import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:social_app/core/error/failure.dart';

import 'package:social_app/features/login/data/models/login_request.dart';

import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_remote_data_source.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource = LoginRemoteDataSource();

  @override
  Future<Either<Failure, void>> login(LoginRequest loginRequest) async {
    try {
      await _loginRemoteDataSource.login(loginRequest);
      return const Right(null);
    } catch (e) {
      debugPrint('Error: $e}');
      return Left(Failure());
    }
  }
}

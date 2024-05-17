import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../app/data/data_source/app_local_data_source.dart';
import '../../../../core/error/failure.dart';
import '../../../register/data/models/user_model.dart';
import '../../domain/repositories/settings_repository.dart';
import '../data_source/settings_remote_data_source.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final AppLocalDataSource _appLocalDataSource = AppLocalDataSource();
  final SettingsRemoteDataSource _settingsRemoteDataSource =
      SettingsRemoteDataSource();

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final String userId = await _appLocalDataSource.userId;
      final UserModel user =
          await _settingsRemoteDataSource.getUserInfo(userId);
      return Right(user);
    } catch (e) {
      debugPrint('Get User Info Error: $e');
      throw Exception(e);
    }
  }
}

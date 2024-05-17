import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../register/data/models/user_model.dart';

abstract class SettingsRepository{
  Future<Either<Failure,UserModel>> getUser();
  Future<Either<Failure,void>> updateUserName(String newName);
}
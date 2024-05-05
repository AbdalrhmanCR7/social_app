import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/login_request.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> login(LoginRequest loginRequest);
}

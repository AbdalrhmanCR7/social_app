import 'package:dartz/dartz.dart';
import 'package:social_app/core/error/failure.dart';

import '../../data/models/register_request.dart';

abstract class RegisterRepository {
  Future<Either<Failure,void>> register(RegisterRequest registerRequest);


}
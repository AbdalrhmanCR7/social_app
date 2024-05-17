import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/x_file_entity.dart';

abstract class NewPostRepository {
  Future<Either<Failure, void>> addPost(
    XFileEntities xFileEntities,
    String postTitle,
  );

  Future<Either<Failure,XFileEntities?>> selectImage();
}

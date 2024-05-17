import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/file_entity.dart';
import '../../domain/entities/x_file_entity.dart';
import '../../domain/repositories/new_post_repository.dart';
import '../data_source/new_posts_remote_data_source.dart';
import '../models/post_model.dart';

class NewPostRepositoryImpl extends NewPostRepository {
  final NewPostsRemoteDataSource _newPostsRemoteDataSource =
      NewPostsRemoteDataSource();

  @override
  Future<Either<Failure, void>> addPost(
    XFileEntities xFileEntities,
    String postTitle,
  ) async {
    try {
      final FileEntities image =
          await _newPostsRemoteDataSource.uploadFile(xFileEntities, 'Posts');
      final Post post = Post(
        title: postTitle,
        timestamp: Timestamp.now(),
        image: image.url,
      );
      await _newPostsRemoteDataSource.addPost(post);
      return const Right(null);
    } catch (e) {
      debugPrint('Add Post Error: $e');
      throw Exception(e);
    }
  }

  @override
  Future<Either<Failure, XFileEntities?>> selectImage() async {
    try {
      final XFileEntities? result =
          await _newPostsRemoteDataSource.selectImage();
      return Right(result);
    } catch (e) {
      debugPrint('Select image Error: $e');
      throw Exception(e);
    }
  }
}

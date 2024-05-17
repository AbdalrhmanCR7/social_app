import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entities/file_entity.dart';
import '../../domain/entities/x_file_entity.dart';
import '../models/post_model.dart';

class NewPostsRemoteDataSource {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FileEntities> uploadFile(
    XFileEntities xFileEntities,
    String folderName,
  ) async {
    final String path = "$folderName/${xFileEntities.name}";
    final Reference storageRef = _storage.ref(path);
    await storageRef.putData(xFileEntities.xFileAsBytes);
    final String fileUrl = await storageRef.getDownloadURL();
    final FileEntities fileEntities =
        FileEntities(name: xFileEntities.name, url: fileUrl);
    return fileEntities;
  }

  Future<void> addPost(Post post) async {
    await _firestore.collection('Posts').add(post.toMap());
  }

  Future<XFileEntities?> selectImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      Uint8List selected = await imagePicked.readAsBytes();
      String selectedName = imagePicked.name;
      final XFileEntities xFileEntities =
          XFileEntities(name: selectedName, xFileAsBytes: selected);
      return xFileEntities;
    }
    return null;
  }
}

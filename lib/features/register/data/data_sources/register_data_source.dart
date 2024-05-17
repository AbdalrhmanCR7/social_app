import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/register_request.dart';
import '../models/user_model.dart';

class RegisterDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserModel> register(RegisterRequest registerRequest) async {
    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: registerRequest.email,
      password: registerRequest.password,
    );
    final UserModel userModel = UserModel(
      id: userCredential.user!.uid,
      fullName: registerRequest.fullName,
      email: registerRequest.email,
    );
    await _firebaseFirestore
        .collection('Users')
        .doc(userModel.id)
        .set(userModel.toMap());
    return userModel;
  }
}

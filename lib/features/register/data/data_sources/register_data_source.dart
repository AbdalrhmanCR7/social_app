import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/register_request.dart';
import '../models/user_model.dart';

class RegisterDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> register(RegisterRequest registerRequest) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: registerRequest.email, password: registerRequest.password);
    final UserModel userModel = UserModel(
        fullName: registerRequest.fullName, email: registerRequest.email);
    await _firebaseFirestore.collection('Users').add(userModel.toMap());
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/register_request.dart';

class RegisterDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> register(RegisterRequest registerRequest) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: registerRequest.email, password: registerRequest.password);
    await _firebaseFirestore.collection('Users').add(registerRequest.toMap());
  }
}
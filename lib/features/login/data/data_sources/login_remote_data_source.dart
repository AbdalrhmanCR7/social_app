import 'package:firebase_auth/firebase_auth.dart';

import '../models/login_request.dart';

class LoginRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> login(LoginRequest loginRequest) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: loginRequest.email,
      password: loginRequest.password,
    );
  }
}

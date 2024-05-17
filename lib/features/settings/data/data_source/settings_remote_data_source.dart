import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../register/data/models/user_model.dart';

class SettingsRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserInfo(String userId) async {
    final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await _firestore.collection("Users").doc(userId).get();
    final Map<String, dynamic> userMap = userSnapshot.data()!;
    final UserModel user = UserModel.fromMap(userMap);
    return user;
  }

  Future<void> updateUserName(String userId, String newName) async {
    await _firestore.collection('Users').doc(userId).update(
      {
        'fullName': newName,
      },
    );
  }
}

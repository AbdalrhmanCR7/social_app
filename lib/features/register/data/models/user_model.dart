class UserModel {
  final String id;
  final String email;
  final String fullName;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
    );
  }
}

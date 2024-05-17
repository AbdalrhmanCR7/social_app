class UserModel{
  final String email;
  final String fullName;

  UserModel({required this.fullName,required this.email,});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      fullName: map['fullName'] as String,
    );
  }
}
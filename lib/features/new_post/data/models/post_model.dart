import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String title;

  final String image;
  final Timestamp timestamp;

  const Post({
    required this.title,
    required this.image,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'timestamp': timestamp,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      title: map['title'] as String,
      image: map['image'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }
}

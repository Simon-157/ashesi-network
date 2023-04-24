import 'package:cloud_firestore/cloud_firestore.dart';

class UserPost {
  final String username;
  final String title;
  final String description;
  final Timestamp createdAt;

  UserPost(
      {required this.username,
        required this.createdAt,
      required this.title,
      required this.description});
}

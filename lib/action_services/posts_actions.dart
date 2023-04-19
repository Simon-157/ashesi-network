import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addPost(String title, String description) async {
  try {
    await FirebaseFirestore.instance.collection('posts').add({
      'title': title,
      'description': description,
      'createdAt': FieldValue
          .serverTimestamp(), // <-- set createdAt field to server timestamp
    });
    print('post created');
  } catch (error) {
    print('Error adding post: $error');
  }
}

Stream<QuerySnapshot<Map<String, dynamic>>> getPostsStream() {
  return FirebaseFirestore.instance
      .collection('posts')
      .orderBy('createdAt', descending: true) // <-- order by createdAt field
      .snapshots();
}

Future<void> deleteCollection() async {
  try {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('posts').get();

    for (final DocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      await doc.reference.delete();
    }
    print('deleted');
  } catch (error) {
    print('Error deleting collection: $error');
  }
}

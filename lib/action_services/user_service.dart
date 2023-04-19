import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
// ignore: non_constant_identifier_names
CollectionReference user_ref = db.collection('users');

Future<void> addUser(
    String uid,
    String name,
    String dob,
    String email,
    String password,
    String Id,
    String favFod,
    String major,
    String residence,
    String yearGroup) async {
  DocumentSnapshot documentSnapshot = await user_ref.doc(uid).get();

  if (documentSnapshot.exists) {
    // User already exists
    print("User with uid=$uid already exists");
  } else {
    // User doesn't exist, add them to the collection
    Map<String, String> user = {
      "name": name,
      "dob": dob,
      "email": email,
      "password": password,
      "id": Id,
      "favFod": favFod,
      "major": major,
      "residence": residence,
      "yearGroup": yearGroup
    };

    await user_ref
        .doc(uid)
        .set(user)
        .then((value) => print("User with uid=$uid added to collection"));
  }
}

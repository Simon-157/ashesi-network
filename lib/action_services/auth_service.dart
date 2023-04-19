import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_network/action_services/user_service.dart';
import 'package:social_network/action_services/user_service_api.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

var uid = null;

Future<String?> registerWithEmailPassword(
    String name,
    String dob,
    String email,
    String password,
    String Id,
    String favFod,
    String major,
    String residence,
    String yearGroup) async {
  // Initialize Firebase
  await Firebase.initializeApp();

  final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  final User user = userCredential.user!;

  assert(user.uid != null);
  assert(user.email != null);

  uid = user.uid;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  // Call registerStudent function with formData parameter
  registerStudent({
    'user_id':user.uid,
    'name': name,
    'dob': dob,
    'email': email,
    'password': password,
    'student_id': Id,
    'favFod': favFod,
    'major': major,
    'residence': residence,
    'yearGroup': yearGroup,
  });

  return 'Successfully registered, User UID: ${user.uid}';
}

Future<String> signOut() async {
  print('got here');
  await _auth.signOut();
  FirebaseAuth.instance.signOut();
  uid = null;
  print("signed out");
  return 'User signed out';
}

Future<String?> signInWithEmailPassword(String email, String password) async {
  // Initialize Firebase
  await Firebase.initializeApp();

  final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  final User? user = userCredential.user;

  if (user != null) {
    print("got here");
    assert(user.uid != null);
    assert(user.email != null);

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User? currentUser = _auth.currentUser;
    assert(user.uid == currentUser?.uid);
    uid = currentUser?.uid;

    print('Successfully logged in, User UID: ${user.uid}');
    return 'Successfully logged in, User UID: ${user.uid}';
  } else {
    print("invalid credentials");
  }

  return null;
}

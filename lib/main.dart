import 'package:flutter/material.dart';
import 'package:social_network/pallete.dart';
import 'package:social_network/router/router.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCjUiewIuMievmm9_bt_PicZSHCR058naA",
        authDomain: "ashesi-network.firebaseapp.com",
        projectId: "ashesi-network",
        storageBucket: "ashesi-network.appspot.com",
        messagingSenderId: "60776008591",
        appId: "1:60776008591:web:17bdb40322d871a63199fa"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Social Network',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      // Sign: SignUpPage(),
    );
  }
}

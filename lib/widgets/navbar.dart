import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_network/action_services/auth_service.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/ashesi.png',
              width: 50,
              height: 50,
            ),
            Text(
              'AshNetwork',
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                letterSpacing: 3,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: screenSize.width / 8),
                  InkWell(
                    onTap: () => {context.go('/posts')},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Posts',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          child: Container(
                            height: 2,
                            width: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenSize.width / 50,
            ),
            Row(
              children: [
                FirebaseAuth.instance.currentUser != null
                    ? IconButton(
                        onPressed: () {
                          context.go('/add_post');
                        },
                        icon: const Icon(
                          Icons.add_circle_outline_rounded,
                          size: 35,
                        ))
                    : Container(),
                const SizedBox(
                  width: 20,
                ),
                FirebaseAuth.instance.currentUser == null
                    ? InkWell(
                        onTap: () => {context.go('/login')},
                        child: const Text(
                          'sign in',
                          style: TextStyle(color: Colors.white),
                        ))
                    : IconButton(
                        onPressed: () {
                          signOut();
                          context.go('/');
                        },
                        icon: const Icon(
                          Icons.logout,
                          size: 35,
                        )),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => {
                    context.go(
                        '/profile/${FirebaseAuth.instance.currentUser!.uid}')
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(115, 116, 227, 227),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

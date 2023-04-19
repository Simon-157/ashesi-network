import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(10, 20, 5, 10),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/profile.jpeg'),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  'Hortense Berabose Umubyeyi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  '@Hortense_',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '0',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '5.3K',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.person,
                      color: Color.fromARGB(96, 67, 66, 66),
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 49, 47, 47),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.list,
                      color: Color.fromARGB(96, 67, 66, 66),
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'List',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 49, 47, 47),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.bookmark,
                      color: Color.fromARGB(96, 67, 66, 66),
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Bookmarks',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 49, 47, 47),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.book_sharp,
                      color: Color.fromARGB(96, 67, 66, 66),
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Moments',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 49, 47, 47),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 60,
                  color: Colors.grey,
                ),
                const Text(
                  'Settings & Privacy',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Help Center',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 400,
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

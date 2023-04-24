import 'package:flutter/material.dart';
import 'package:social_network/utils/posts_struct.dart';
import 'package:social_network/widgets/navbar.dart';
import 'package:social_network/pages/posts.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TopBar(),
                SizedBox(
                  height: 2,
                ),
                UserPostsWidget()
              ],
            )),
      ),
    );
  }
}

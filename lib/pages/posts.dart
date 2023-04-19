import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_network/action_services/posts_actions.dart';
import 'package:social_network/utils/posts_struct.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserPostsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: getPostsStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final documents = snapshot.data!.docs;

            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: documents.length,
              itemBuilder: (BuildContext context, int index) {
                final data = documents[index].data();
                final userPost = UserPost(
                  createdAt: data['createdAt'],
                  title: data['title'],
                  description: data['description'],
                  // date: data['date'],
                );

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserPostCard(userPost: userPost),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class UserPostCard extends StatelessWidget {
  final UserPost userPost;

  UserPostCard({required this.userPost});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.0,
      height: 150,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(203, 39, 48, 62),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
            CircleAvatar(
              radius: 20,
              backgroundColor: Color.fromARGB(115, 116, 227, 227),
            ),
            SizedBox(
              width: 10,
            ),
            Center(
                child: Text(
              "Hortense",
              style: TextStyle(
                  color: Color.fromARGB(255, 212, 189, 189), fontSize: 15),
            )),
          ]),
          Text(
            userPost.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            userPost.description,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            timeago.format(userPost.createdAt.toDate()),
            style: const TextStyle(
              color: Color.fromARGB(255, 158, 158, 158),
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}

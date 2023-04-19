import 'package:flutter/material.dart';
import 'package:social_network/action_services/posts_actions.dart';
import 'package:social_network/pages/create_post.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CreatePostWidget(onSubmit: addPost,)
             ),
    );
  }
}

import 'package:flutter/material.dart';

class PostCreatedDialog extends StatelessWidget {
  late final Function() onClose;

  PostCreatedDialog({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Post submitted successfully'),
      content: const Text('Your post has been created.'),
      actions: <Widget>[
        TextButton(
          onPressed: onClose,
          child: const Text('Close'),
        ),
      ],
    );
  }
}

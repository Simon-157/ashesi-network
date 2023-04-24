import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_network/action_services/user_service_api.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _yearGroupController = TextEditingController();
  late TextEditingController _bestFoodController = TextEditingController();
  late TextEditingController _bestMovieController = TextEditingController();
  late TextEditingController _majorController = TextEditingController();
  late TextEditingController _residenceController = TextEditingController();

  updateDialog() {
    // Create the AlertDialog
    return AlertDialog(
      title: const Text('Success'),
      content: const Text('Profile updated successfully'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            context.go('/profile/${FirebaseAuth.instance.currentUser!.uid}');
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getStudent(FirebaseAuth.instance.currentUser!.uid).then((user) {
      setState(() {
        _yearGroupController = TextEditingController(text: user["yearGroup"]);
        _bestFoodController = TextEditingController(text: user["favFod"]);
        _majorController = TextEditingController(text: user["major"]);
        _bestMovieController = TextEditingController(text: user["best_movie"]);
        _residenceController = TextEditingController(text: user["residence"]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/thumbnails/001/993/889/small/beautiful-latin-woman-avatar-character-icon-free-vector.jpg',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 650,
                child: TextField(
                  controller: _majorController,
                  decoration: const InputDecoration(
                    labelText: 'Major',
                    border: OutlineInputBorder(),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(223, 209, 210, 1)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(225, 210, 211, 1)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 650,
                child: TextField(
                  controller: _yearGroupController,
                  decoration: const InputDecoration(
                    labelText: 'Year Group',
                    border: OutlineInputBorder(),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(221, 204, 205, 1)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(228, 212, 213, 1)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 650,
                child: TextField(
                  controller: _bestFoodController,
                  decoration: const InputDecoration(
                    labelText: 'Best food ',
                    border: OutlineInputBorder(),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(230, 202, 203, 1)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(224, 194, 195, 1)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 650,
                child: TextField(
                  controller: _bestMovieController,
                  decoration: const InputDecoration(
                    labelText: 'Best MOvie ',
                    border: OutlineInputBorder(),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(230, 202, 203, 1)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(224, 194, 195, 1)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 650,
                child: TextField(
                  controller: _residenceController,
                  decoration: const InputDecoration(
                    labelText: 'Residence ',
                    border: OutlineInputBorder(),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(227, 216, 216, 1)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(232, 220, 220, 1)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        Map<String, dynamic> formData = {
                          'major': _majorController.text,
                          'yearGroup': _yearGroupController.text,
                          'best_food': _bestFoodController.text,
                          'best_movie': _bestMovieController.text,
                          // 'date_of_birth': widget.user.date_of_birth,
                          'residence': _residenceController.text
                        };
                        bool status = await updateStudent(
                            formData, FirebaseAuth.instance.currentUser!.uid);

                        if (status) {
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return updateDialog();
                            },
                          );
                        }
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(
                            color: Color.fromARGB(226, 245, 244, 244)),
                      ))),
            ],
          ),
        ));
  }
}

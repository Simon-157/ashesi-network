import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 650,
                child: TextField(
                  // controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Student Name',
                    border: OutlineInputBorder(),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(227, 214, 215, 1)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(216, 202, 203, 1)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 650,
                child: TextField(
                  // controller: _nameController,
                  decoration: InputDecoration(
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
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 650,
                child: TextField(
                  // controller: _nameController,
                  decoration: InputDecoration(
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
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 650,
                child: TextField(
                  // controller: _nameController,
                  decoration: InputDecoration(
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
                height: 10,
              ),
              SizedBox(
                width: 650,
                child: TextField(
                  // controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Best Movie ',
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
            ],
          ),
        ));
  }
}

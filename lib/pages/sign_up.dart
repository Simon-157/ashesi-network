import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_network/action_services/auth_service.dart';
import 'package:social_network/components/success_dialog.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dobController = TextEditingController();
  final _schoolIdController = TextEditingController();
  final _favoriteFoodController = TextEditingController();
  final _name = TextEditingController();
  final _yeargroup = TextEditingController();
  final _campusResidence = TextEditingController();
  final _bestMovie = TextEditingController();
  final _major = TextEditingController();

  void handleSubmit() {
    if (_formKey.currentState!.validate()) {
      registerWithEmailPassword(
          _name.text,
          _dobController.text,
          _emailController.text,
          _passwordController.text,
          _schoolIdController.text,
          _favoriteFoodController.text,
          _major.text,
          _campusResidence.text,
          _yeargroup.text);
    }

    print(
        '${_name.text + _dobController.text + _emailController.text + _passwordController.text + _schoolIdController.text + _favoriteFoodController.text + _major.text + _campusResidence.text + _yeargroup.text}');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PostCreatedDialog(onClose: () {
          Navigator.of(context).pop();
          context.go('/login');
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@ashesi\.edu\.gh$');

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Sign Up')),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: SizedBox(
                  width: 500,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/str.jpeg'),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _name,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your favorite food';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _yeargroup,
                        decoration: const InputDecoration(
                          labelText: 'Year Group',
                          hintText: 'Enter your year group',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your favorite food';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.0)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email cannot be empty';
                            } else if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid Ashesi email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _dobController,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          labelText: 'Date of Birth',
                          hintText: 'YYYY-MM-DD',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your date of birth';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _schoolIdController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'School ID',
                          hintText: 'Enter your school ID',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your school ID';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _major,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Major',
                          hintText: 'Enter your major',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your school ID';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _campusResidence,
                        decoration: const InputDecoration(
                          labelText: 'Campus Residence',
                          hintText: 'Enter Campus Residence',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your campus residence';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _bestMovie,
                        decoration: const InputDecoration(
                          labelText: 'Favorite Movie',
                          hintText: 'Enter your favorite movie',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your favorite food';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _favoriteFoodController,
                        decoration: const InputDecoration(
                          labelText: 'Favorite Food',
                          hintText: 'Enter your favorite food',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your favorite food';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: 500,
                        height: 50,
                        child: ElevatedButton(
                            child: const Text('Register'),
                            onPressed: () {
                              handleSubmit();
                            }),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            context.go('/login');
                          },
                          child: const Text(
                            "Already have an account ? Login",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(233, 224, 219, 184)),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

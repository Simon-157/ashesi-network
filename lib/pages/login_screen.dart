import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_network/action_services/auth_service.dart';
import 'package:social_network/components/success_dialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void handleSubmit() {
    if (_formKey.currentState!.validate()) {
      signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      ).then((value) => context.go('/posts'));
    }

    print('${_emailController.text + _passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@ashesi\.edu\.gh$');

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Log In')),
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
                      const SizedBox(height: 32),
                      SizedBox(
                        width: 500,
                        height: 50,
                        child: ElevatedButton(
                            child: const Text('Sign In'),

                            //     TextButton(
                            //       onPressed()=>{context.go('/dash')}, child: const Text('Or sign up here? ', style: TextStyle(
                            // color: Colors.white10,
                            //     ),

                            onPressed: () {
                              handleSubmit();
                            }),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            context.go('/register');
                          },
                          child: const Text(
                            "Dont have an account ? Register",
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

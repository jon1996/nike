import 'package:flutter/material.dart';
import 'package:nike/Component/MyRouter.dart';
import 'package:nike/Component/MytextField.dart';
import 'package:nike/screens/Auth/Register.dart';
import 'package:nike/screens/Auth/forgetPassword.dart';
import 'package:nike/screens/home.dart';

import '../../Component/myButton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>(); // Form key to manage form state

  // Email and password controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Email validation
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validation (not empty)
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  // Form submit handler
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // If valid, navigate to the home page

      Navigator.pushReplacement(
        context,
        createRoute(MyHomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Nike-Logo.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    color: Colors.grey[500],
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/nike1.png',
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'WELCOME BACK',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Sign in to your account',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    text: 'Email',
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: _validateEmail,
                  ),
                  MyTextField(
                    text: 'Password',
                    icon: Icons.lock,
                    isPassword: true,
                    controller: _passwordController,
                    validator: _validatePassword,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              createRoute(Forgetpassword()),
                            );
                          },
                          child: Text('Forgot Password?',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Mybutton(
                      text: 'SIGN IN',
                      onTap: _submitForm, // Use the form submit function
                      color: Colors.grey[900],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      createRoute(Register()),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
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

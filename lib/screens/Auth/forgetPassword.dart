// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nike/screens/Auth/Login.dart';
import 'package:nike/screens/home.dart';
import 'package:nike/screens/welcome.dart';

import '../../Component/MyRouter.dart';
import '../../Component/MytextField.dart';
import '../../Component/myButton.dart';

class Forgetpassword extends StatefulWidget {
  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  final _formKeys = GlobalKey<FormState>();
  // Form key to manage form state
  final TextEditingController _emailController = TextEditingController();

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

// Form submit handler
  void _submitForm() {
    if (_formKeys.currentState?.validate() ?? false) {
      // If valid, show the dialog
      _showDialog(context); // Simply call the _showDialog function
    }
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Reset Password',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Check your email for instructions',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to WelcomeScreen after dialog closes
                  Navigator.pushReplacement(
                    context,
                    createRoute(Login()), // Navigate to WelcomeScreen
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Mybutton(
                    text: 'OK',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        createRoute(Login()), // Navigate to WelcomeScreen
                      );
                    }, // We don't need onTap here, as it's handled above
                    color: Colors.grey[900],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget password?'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
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
                    left: 150,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/shoes.png',
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Forget Password?',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Reset your password',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Form(
                key: _formKeys,
                child: Column(
                  children: [
                    MyTextField(
                      text: 'Email',
                      icon: Icons.email,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Mybutton(
                        text: 'Reset Password',
                        onTap: () {
                          _submitForm();
                        },
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

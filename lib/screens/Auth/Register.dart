import 'package:flutter/material.dart';
import 'package:nike/screens/Auth/Login.dart';

import '../../Component/MyRouter.dart';
import '../../Component/MytextField.dart';
import '../../Component/myButton.dart';
import '../home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKeyRegister =
      GlobalKey<FormState>(); // Form key to manage form state

  // Email and password controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
    if (_formKeyRegister.currentState?.validate() ?? false) {
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
              padding: const EdgeInsets.only(top: 80),
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
                    left: 100,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/register.png',
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'SIGN UP',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Create an account to continue',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKeyRegister,
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
                  MyTextField(
                    text: 'Confirm Password',
                    icon: Icons.lock,
                    isPassword: true,
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Mybutton(
                      text: 'SIGN UP',
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
                  'Already have an account? ',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      createRoute(Login()),
                    );
                  },
                  child: Text(
                    'Sign in',
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

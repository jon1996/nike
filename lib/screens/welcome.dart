import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nike/Component/myButton.dart';

import '../Component/MyRouter.dart';
import 'Auth/Login.dart';
import 'Auth/Register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight =
        MediaQuery.of(context).size.height; // Get screen height

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/welcome image.jpg',
              height: screenHeight * 0.8,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 35,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/svg/nike-11.svg',
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Mybutton(
            text: 'SIGN IN',
            onTap: () {
              Navigator.pushReplacement(
                context,
                createRoute(
                  Login(),
                ),
              );
            },
            color: Colors.grey[900],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Mybutton(
            text: 'SIGN UP',
            onTap: () {
              Navigator.pushReplacement(
                context,
                createRoute(
                  Register(),
                ),
              );
            },
            color: Colors.grey[900],
          ),
        ),
      ]),
    );
  }
}

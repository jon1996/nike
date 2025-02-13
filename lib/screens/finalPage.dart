import 'package:flutter/material.dart';
import 'package:nike/screens/home.dart';

import '../Component/MyRouter.dart';
import '../Component/myButton.dart';

class Finalpage extends StatefulWidget {
  const Finalpage({super.key});

  @override
  State<Finalpage> createState() => _FinalpageState();
}

class _FinalpageState extends State<Finalpage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes items apart
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/gif/checkout.gif',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Thank you for your purchase!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0), // Adds bottom spacing
            child: Mybutton(
              text: 'Home',
              width: 200,
              // Navigate to the home page
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(const MyHomePage()),
                );
              },
              color: Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final path = Path()
      ..addArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2 - 4,
        ),
        0,
        3,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final Color? color;
  final double width;
  final double height;
  final Function()? onTap;

  const Mybutton({
    super.key,
    required this.text,
    this.color = Colors.black, // Default color
    this.width = double.infinity, // Default width
    this.height = 50.0,
    this.onTap, // Default height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

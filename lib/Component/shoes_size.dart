import 'package:flutter/material.dart';

class ShoesSize extends StatelessWidget {
  const ShoesSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 30,
          // Add some margin between items
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text('40'), // Display the number starting from 1
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 30,
          width: 30,
          // Add some margin between items
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text('42'), // Display the number starting from 1
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 30,
          width: 30,
          // Add some margin between items
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text('43'), // Display the number starting from 1
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 30,
          width: 30,
          // Add some margin between items
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text('45'), // Display the number starting from 1
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 30,
          width: 30,
          // Add some margin between items
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text('50'), // Display the number starting from 1
          ),
        ),
      ],
    );
  }
}

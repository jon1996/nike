import 'dart:math';

import 'package:flutter/material.dart';

import '../Model/product.dart';
import 'myButton.dart';

class DiscountCard extends StatelessWidget {
  DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    final String randomShoe =
        (Random().nextInt(4)).toString(); // Selects random shoe
    final Product product;
    return Container(
      margin: EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 5,
            left: 10,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '20% Discount',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'On your first purchase',
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Mybutton(
                  text: 'Shop Now',
                  color: Colors.grey[900], // Custom color
                  width: 120, // Custom width
                  height: 50, // Custom height
                ),
              ],
            ),
          ),
          Positioned(
            top: -10,
            bottom: -80,
            right: -60,
            child: Transform.rotate(
                angle: 6.5,
                child: Image.asset(
                  'assets/images/shoes.png',
                  height: 400,
                  width: 400,
                )),
          ),
        ],
      ),
    );
  }
}

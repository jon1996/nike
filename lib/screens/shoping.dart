import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Shoping extends StatefulWidget {
  const Shoping({super.key});

  @override
  State<Shoping> createState() => _ShopingState();
}

class _ShopingState extends State<Shoping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56), // Standard AppBar height
        child: AppBar(
          title: Center(
            child: SvgPicture.asset('assets/svg/nike-11.svg', width: 50),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/shoping.dart';
import 'MyRouter.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: SvgPicture.asset(
            'assets/svg/nike-11.svg',
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Cart'),
          onTap: () {
            Navigator.pop(context); // Close the drawer

            Navigator.push(
              context,
              createRoute(Shoping()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
      ],
    ));
  }
}

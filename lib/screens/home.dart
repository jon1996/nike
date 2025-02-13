import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike/screens/shoping.dart';

import '../Component/CategoryTab.dart';
import '../Component/MyRouter.dart';
import '../Component/discount.dart';
import '../Component/myDrawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56), // Standard AppBar height
        child: AppBar(
          title: Center(
            child: SvgPicture.asset('assets/svg/nike-11.svg', width: 50),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      createRoute(Shoping()),
                    );
                  },
                  child: Icon(Icons.shopping_cart, color: Colors.grey[900])),
            ),
          ],
        ),
      ),
      drawer: Mydrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/home1-icon.svg',
                width: 20,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/saved-icon.svg',
                width: 20,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/bell-line-icon.svg',
                width: 20,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/persona-icon.svg',
                width: 20,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DiscountCard(),
            SizedBox(
              height: 20,
            ),
            Categorytab(),
          ],
        ),
      ),
    );
  }
}

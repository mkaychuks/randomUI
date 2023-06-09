import 'package:flutter/material.dart';

import 'screens.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const CardPage(),
    const ProfilePage(),
  ];

  void onTap(index){
    setState(() {
      currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0D0D0C),
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0XFF0D0D0C),
        currentIndex: currentIndex,
        elevation: 0.0,
        onTap: onTap,
        selectedItemColor: const Color(0xffB6EF11),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Transactions"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Settings"),

        ],
      ),
    );
  }
}

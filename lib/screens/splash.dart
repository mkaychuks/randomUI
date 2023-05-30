import 'package:flutter/material.dart';
import 'package:learn_riverpod/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomNav(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0XFF0D0D0C),
        child: const Text(
          "HBank",
          style: TextStyle(
              color: Color(0XFFB6EF11),
              fontSize: 48,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

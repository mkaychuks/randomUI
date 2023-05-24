import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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

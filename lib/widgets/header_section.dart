import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // the image and the name
        const HeroSection(),
        // the bell icon
        Image.asset("images/bell.png")
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // the image
        Image.asset("images/person.png"),
        const SizedBox(
          width: 12,
        ),

        // the name
        SizedBox(
          height: 42,
          width: 83,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Toni Kross",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Good Morning",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

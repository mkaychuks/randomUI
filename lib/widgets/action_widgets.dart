import 'package:flutter/material.dart';

class ActionWidgets extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final String imageUrl;
  BoxFit? imagefit = BoxFit.cover;


  ActionWidgets({
    Key? key,
    this.onTap,
    required this.text,
    required this.imageUrl,
    this.imagefit
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: SizedBox(
          width: 88,
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // top
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0XFF1B1B1B),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    imageUrl,
                    fit: imagefit,
                    // color: Colors.white,
                  ),
                ),
              ),
      
              // bottom
              Text(
                text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

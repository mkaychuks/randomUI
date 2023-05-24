// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TotalSection extends StatelessWidget {
  final int price;

  const TotalSection({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      width: 202,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total Balance",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          Text(
            "\$${price.toString()} USD",
            style: const TextStyle(
              color: Color(0XFFB6EF11),
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

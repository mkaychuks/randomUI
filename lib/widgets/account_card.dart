import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.price,
  });

  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
          color: const Color(0xffD3F570),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: Colors.white)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // current balance and hbank
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Current Balance",
                style: TextStyle(color: Color(0xff6E6E6D)),
              ),
              Text(
                "HBank",
                style: TextStyle(
                    color: Color(0xff0D0D0C),
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),

          // total balance
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              "\$${price.toString()}",
              style: const TextStyle(
                color: Color(0xff0D0D0C),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // account name and type
          const SizedBox(height: 44),
          const Text(
            "Credit Card",
            style: TextStyle(
              color: Color(0xff6E6E6D),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "0347 582 425 245",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Image.asset("images/visa.png"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

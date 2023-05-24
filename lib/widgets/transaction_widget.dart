// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TransactionsWidget extends StatelessWidget {
  final bool moneyOut;
  final String name;
  final String category;
  final int price;
  const TransactionsWidget({
    Key? key,
    required this.moneyOut,
    required this.name,
    required this.category,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: moneyOut ? const Color(0xff9280FD) : const Color(0xffD3F570),
        ),
        child: Transform.rotate(
          angle: moneyOut ? 2 : 5,
          child: Icon(
            Icons.arrow_back,
            color: moneyOut ? Colors.black : Colors.white,
          ),
        ),
      ),
      title: RichText(
        text: TextSpan(
          text: moneyOut ? "To $name" : "From $name",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          children: [
            TextSpan(
              text: " . $category",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      trailing: Text(moneyOut ? "-\$${price.toString()}" : "+\$${price.toString()}", style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
      subtitle: const Text("!2 June, 2022", style:TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white),),
    );
  }
}

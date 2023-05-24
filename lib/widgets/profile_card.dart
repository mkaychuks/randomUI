// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const ProfileCardWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xff1B1B1B).withOpacity(1),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // the right side of the row
          Row(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: color
                ),
                child: Icon(icon, color: Colors.white,),
              ),
              const SizedBox(width: 20,),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
            ],
          ),

          // left side of the row
          const Icon(Icons.chevron_right, size: 30, color: Colors.white,)
        ],
      ),
    );
  }
}

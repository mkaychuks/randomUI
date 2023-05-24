import 'package:flutter/material.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF0D0D0C),
        appBar: AppBar(
          backgroundColor: const Color(0XFF0D0D0C),
          elevation: 0.0,
          leading: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
          centerTitle: true,
          title: const Text(
            "Send Money",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // the card that shows person to send
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Send To",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  const SizedBox(height: 12),
                  buildUpperCard(),
                ],
              ),

              // the amount
              const SizedBox(height: 60),
              const Text(
                "Enter Amount",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
              const SizedBox(height: 20),
              const Text(
                "\$1250",
                style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),

              // the send button
              const SizedBox(height: 60),
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xffB6EF11)),
                child: const Center(
                  child: Text(
                    "Send",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              )

              // the numeric pads

            ],
          ),
        ),
      ),
    );
  }

  Container buildUpperCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 78.0,
      decoration: BoxDecoration(
        color: const Color(0xff1B1B1B).withOpacity(1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // first row
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "images/image3.jpeg",
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: const [
                    Text(
                      "Watson",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "12344555",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),

          // second row
          Transform.rotate(
            angle: 7.9,
            child: const Icon(
              Icons.chevron_right,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

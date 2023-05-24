import 'package:flutter/material.dart';
import 'package:learn_riverpod/widgets/profile_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF0D0D0C),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              SizedBox(height: 57),
              // the card with profile picture
              UpperContainer(),

              // the various cards in the list of things
              SizedBox(height: 24),
              ProfileCardWidget(
                icon: Icons.supervised_user_circle,
                title: "Profile Settings",
                color: Color(0xff9280FD),
              ),
              SizedBox(height: 20),
              ProfileCardWidget(
                icon: Icons.settings,
                title: "Settings",
                color: Color(0xffD3F570),
              ),
              SizedBox(height: 20),
              ProfileCardWidget(
                icon: Icons.headphones,
                title: "Support",
                color: Color(0xff9280FD),
              ),
              SizedBox(height: 20),
              ProfileCardWidget(
                icon: Icons.logout,
                title: "Sign out",
                color: Color(0xffD3F570),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      height: 204,
      decoration: BoxDecoration(
          color: const Color(0xff1B1B1B).withOpacity(1),
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          //  the image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "images/image3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // the name
          const SizedBox(height: 20),
          const Text(
            "Toni Kross",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "tonikross@gmail.com",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}

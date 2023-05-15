import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/provider/basic_provider.dart';
import 'package:learn_riverpod/screens/about.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(myNameProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Column(
            children: [
              Text("Hello World",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Text(
                name,
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const AboutPage(),
                  ));
                },
                icon: Icon(Icons.chevron_right),
                label: Text("About page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

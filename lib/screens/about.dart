import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/provider/basic_provider.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genList = ref.watch(namesProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: ListView(
          children: genList.map((e) => Text(e)).toList(),
        ),
      ),
    );
  }
}
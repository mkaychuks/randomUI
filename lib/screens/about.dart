import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/provider/state_provider.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(currentStateProvider);

    ref.listen<int>(
      currentStateProvider,
      (prev, curr) {
        if (curr == 65) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Value is 65"),
            ),
          );
        }
      },
    );

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
          ),
          body: Center(
            child: Column(
              children: [
                Text(
                  "Current value is ${value.toString()}",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text("Increment"),
                  onPressed: () {
                    ref.read(currentStateProvider.notifier).state += 1;
                  },
                ),
              ],
            ),
          )),
    );
  }
}

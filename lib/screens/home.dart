import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/provider/state_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final isLoading = ref.watch(isLoadingStateProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customInputField(
                context: context,
                hintText: "E.g. John Doe",
                prefixIcon: Icons.person,
                controller: usernameController,
              ),
              const SizedBox(
                height: 12,
              ),
              customInputField(
                context: context,
                hintText: "E.g. xxxxxxxxx",
                prefixIcon: Icons.lock,
                controller: passwordController,
              ),
              const SizedBox(
                height: 12,
              ),
              customButton(
                context: context,
                isLoading: isLoading,
                onTap: () {
                  final username = usernameController.text.trim();
                  final password = passwordController.text.trim();

                  if (username.isNotEmpty && password.isNotEmpty) {
                    ref.read(isLoadingStateProvider.notifier).state = true;
                    Future.delayed(
                      Duration(seconds: 5),
                      () {
                        ref.read(isLoadingStateProvider.notifier).state = false;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Login successful"),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.purpleAccent,
                          ),
                        );
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 2),
                        content: Text("An Error occured"),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customButton(
    {required BuildContext context,
    required void Function()? onTap,
    required bool isLoading}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isLoading ? Colors.grey : Colors.purpleAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        isLoading ? "Please wait...." : "Login",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}

Widget customInputField(
    {BuildContext? context,
    required String hintText,
    required IconData prefixIcon,
    required TextEditingController controller}) {
  return Container(
    height: 64,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: Colors.grey[300]),
    child: TextFormField(
      controller: controller,
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    ),
  );
}

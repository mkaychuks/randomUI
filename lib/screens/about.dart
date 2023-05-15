import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/activity.dart';
import 'package:learn_riverpod/services/api_servce.dart';

final usersApiFutureProvider = FutureProvider.autoDispose<Activity>(
  (ref) async {
    final apiService = ref.watch(userApiServiceProvider);
    return apiService.getActivity();
  },
);



final userApiFutureProvider = FutureProvider.autoDispose<Post>(
  (ref) async {
    final apiService = ref.watch(userApiServiceProvider);
    return apiService.getPost();
  },
);

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersRef = ref.watch(usersApiFutureProvider);
    final userRef = ref.watch(userApiFutureProvider);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
          ),
          body: Column(
            children: [
              Center(
                child: usersRef.when(
                  data: (data) {
                    return Text(data.activity);
                  },
                  error: (error, _) {
                    return Text(error.toString());
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              const SizedBox(height: 50,),
              Center(
                child: userRef.when(
                  data: (data) {
                    return Text(data.title);
                  },
                  error: (error, _) {
                    return Text(error.toString());
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/activity.dart';
import 'package:learn_riverpod/services/api_servce.dart';

final usersFutureProvider =
    FutureProvider.autoDispose<List<Users?>>((ref) async {
  final apiService = ref.watch(usersApiService);
  return apiService.getAllUser();
});

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersFutureProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            users.when(
              data: (data) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => ref.refresh(usersFutureProvider.future),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var item = data[index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(item!.name[0]),
                          ),
                          title: Text(item.username),
                          subtitle: Text(item.email),
                        );
                      },
                    ),
                  ),
                );
              },
              error: (error, _) {
                return Text(error.toString());
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}

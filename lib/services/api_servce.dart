import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/activity.dart';

final userApiServiceProvider = Provider<UserApiService>((ref) => UserApiService());

class UserApiService {
  Future<Activity> getActivity() async {
    try {
      final res = await Dio().get('https://www.boredapi.com/api/activity/');
      return Activity.fromJson(res.data);
    } catch (e) {
      throw Exception("Error getting suggestions");
    }
  }



  Future<Post> getPost() async {
    try {
      final res = await Dio().get('https://jsonplaceholder.typicode.com/posts/1');
      return Post.fromJson(res.data);
    } catch (e) {
      throw Exception("Error getting suggestions");
    }
  }
}

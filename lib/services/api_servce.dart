import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/activity.dart';
import 'package:http/http.dart' as http;


final usersApiService = Provider<UsersApiService>((ref) => UsersApiService());

class UsersApiService {
  
  Future<List<Users?>> getAllUser() async {
    try {
      final uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
      final res = await http.get(uri);
      return usersFromJson(res.body);
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}

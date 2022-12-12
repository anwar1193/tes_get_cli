import 'package:get/get.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  // Ambil Satu Data User Dari API
  Future<User?> getUser(int id) async {
    final response = await get('https://reqres.in/api/users/$id');
    return User.fromJson(response.body["data"]);
  }

  // Ambil Semua Data Dari User API
  Future<List<User>> getAllUsers() async {
    final response = await get('https://reqres.in/api/users');
    return User.fromJsonList(response.body["data"]);
  }
}

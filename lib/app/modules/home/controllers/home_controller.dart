import 'package:get/get.dart';

// Hubungkan dengan provider (seperti http)
import '../../../data/providers/user_provider.dart';

// Hubungkan dengan model
import '../../../data/models/user_model.dart';

class HomeController extends GetxController {
  UserProvider userProv = UserProvider();

  Future<User?> getSingleUser(int id) async {
    return await userProv.getUser(id);
  }

  Future<List<User>> getAllUsers() async {
    return await userProv.getAllUsers();
  }
}

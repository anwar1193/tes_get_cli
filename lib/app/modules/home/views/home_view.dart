import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../data/models/user_model.dart';

class HomeView extends GetView<HomeController> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeViews'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: controller.getAllUsers(),
        builder: (context, snapshot) {
          // Jika masih proses ambil data API
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Jika Tidak Ada Data
          if (snapshot.data?.length == 0) {
            return Center(
              child: Text("Tidak ada data user"),
            );
          } else {
            // Jika Ada Data
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar!),
                  ),
                  title: Text("${user.firstName} ${user.lastName}"),
                  subtitle: Text("${user.email}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}

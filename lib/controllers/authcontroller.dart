import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistflutter/routes/routes.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (usernameController.text.toString() == "admin" &&
        passwordController.text.toString() == "admin") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", usernameController.text.toString());

      isLoggedIn.value = true;

      Get.offAllNamed(AppRoutes.dashboardpage);
      Get.snackbar("Login", "Login Successful");
    } else {
      Get.snackbar("Login", "Invalid username or password");
    }
  }
    Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
        Get.snackbar("Logout", "You have been logged out");

  }

   var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}

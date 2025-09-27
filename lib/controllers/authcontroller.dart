import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistflutter/routes/routes.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    login() async {
      if (usernameController.text.toString() == "admin" && passwordController.text.toString() == "admin") {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("username", usernameController.text.toString());
        Get.offAllNamed(AppRoutes.dashboardpage);
        Get.snackbar("Login", "Login Successful");
      }
     else{
      Get.snackbar("Login", "invalid username or password");
     }
  }   

  void logout() {
    isLoggedIn.value = false;
  }
  
}

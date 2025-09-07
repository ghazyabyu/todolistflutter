import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/controllers/authcontroller.dart';
import '../components/customtextfield.dart';
import '../components/custombutton.dart';
import 'dashboard_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.find<AuthController>(); // ✅ Binding otomatis

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 80, color: Colors.brown.shade600),
              const SizedBox(height: 20),
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              CustomTextField(controller: username, hint: "Username"),
              const SizedBox(height: 16),
              CustomTextField(controller: password, hint: "Password", obscureText: true),

              const SizedBox(height: 24),
              CustomButton(
                text: "Login",
                onPressed: () {
                  bool success = authC.login(username.text, password.text);
                  if (success) {
                    Get.offAllNamed('/dashboardpage'); // ✅ pindah via route
                  } else {
                    Get.snackbar(
                      "Login Failed",
                      "Username atau password salah",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
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

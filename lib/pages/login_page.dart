import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/controllers/authcontroller.dart';
import 'package:todolistflutter/routes/routes.dart';
import '../components/customtextfield.dart';
import '../components/custombutton.dart';
import '../components/customcolor.dart';
import 'dashboard_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.softYellow,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.checklist_sharp, size: 80, color:const Color.fromARGB(255, 157, 190, 154)),
              const SizedBox(height: 20),
              const Text(
                "ULIST",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color:AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "ATUR HIDUP MU MULAI DARI hal kecil",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color:AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              CustomTextField(controller: username, hintText: "Username"),
              const SizedBox(height: 16),
              CustomTextField(controller: password, hintText: "Password", obscureText: true),

              const SizedBox(height: 24),
              CustomButton(
                text: "Login",
                onPressed: () {
                  bool success = authC.login(username.text, password.text);
                  if (success) {
                    Get.offAllNamed(AppRoutes.dashboardpage);//salah
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

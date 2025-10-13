import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/components/custombutton.dart';
import 'package:todolistflutter/components/customcolor.dart';
import 'package:todolistflutter/components/customtextfield.dart';
import 'package:todolistflutter/controllers/authcontroller.dart';
import 'package:todolistflutter/routes/routes.dart';


class LoginWidescreen extends StatelessWidget {
  LoginWidescreen({super.key});



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

              CustomTextField(controller: authC.usernameController, hintText: "Username"),
              const SizedBox(height: 16),
              CustomTextField(controller: authC.passwordController, hintText: "Password", obscureText: true),

              const SizedBox(height: 24),
              CustomButton(
              text: "Login",
            onPressed: () async {
              await authC.login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/components/custombutton.dart';
import 'package:todolistflutter/components/customcolor.dart';
import 'package:todolistflutter/components/customtextfield.dart';
import 'package:todolistflutter/controllers/authcontroller.dart';

class LoginWidescreen extends StatelessWidget {
  LoginWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.softYellow,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView( 
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.checklist_sharp,
                        size: 160,
                        color: const Color.fromARGB(255, 157, 190, 154),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "ULIST",
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "ATUR HIDUP MU MULAI DARI hal kecil",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 100),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Login ke Akun Anda",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomTextField(
                          controller: authC.usernameController,
                          hintText: "Username",
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: authC.passwordController,
                          hintText: "Password",
                          obscureText: true,
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: "Login",
                            onPressed: () async {
                              await authC.login();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

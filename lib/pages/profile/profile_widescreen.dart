import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:todolistflutter/components/custombutton.dart';
import 'package:todolistflutter/components/customcolor.dart';
import 'package:todolistflutter/controllers/authcontroller.dart';
import 'package:todolistflutter/routes/routes.dart';

class ProfileWidescreen extends StatelessWidget {
  ProfileWidescreen({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile 👤"),
        backgroundColor: AppColors.softYellow,
        centerTitle: true,
      ),
      backgroundColor: AppColors.softYellow,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar di kiri
                      const CircleAvatar(
                        radius: 70,
                        backgroundColor: AppColors.verydarkgreen,
                        child: Icon(Icons.person, size: 80, color: Colors.white),
                      ),
                      const SizedBox(width: 50),

                     
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "User Information",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildProfileItem("Username", "EGGADanis"),
                            const SizedBox(height: 16),
                            _buildProfileItem("Email", "EGGADanis@email.com"),
                            const SizedBox(height: 16),
                            _buildProfileItem("Phone", "+68 888 8888 8888"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  
                  SizedBox(
                    width: 250,
                    child: CustomButton(
                      text: "Logout",
                      onPressed: () {
                        authController.logout();
                        Get.offAllNamed(AppRoutes.loginpage);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.darkgreen,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}

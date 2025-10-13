import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:todolistflutter/components/custombutton.dart';
import 'package:todolistflutter/components/customcolor.dart';
import 'package:todolistflutter/controllers/authcontroller.dart';
import 'package:todolistflutter/routes/routes.dart';


class ProfileMobile extends StatelessWidget {
  ProfileMobile({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile 👤"),
        backgroundColor: AppColors.softYellow,
      ),
      backgroundColor: AppColors.softYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.verydarkgreen,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "User Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              _buildProfileItem("Username", "EGGADanis"),
              const SizedBox(height: 12),
              _buildProfileItem("Email", "EGGADanis@email.com"),
              const SizedBox(height: 12),
              _buildProfileItem("Phone", "+68 888 8888 8888"),

              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Logout",
                    onPressed: () {
                      authController.logout();
                      Get.offAllNamed(AppRoutes.loginpage);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.darkgreen,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

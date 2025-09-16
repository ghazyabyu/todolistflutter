import 'package:flutter/material.dart';
import '../components/customcolor.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            color:AppColors.darkgreen,
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

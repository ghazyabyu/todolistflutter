import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/controllers/authcontroller.dart';
import 'package:todolistflutter/pages/profile/profile_mobile.dart';
import 'package:todolistflutter/pages/profile/profile_widescreen.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
         return Obx(()=> controller.isMobile.value ? ProfileMobile() : ProfileWidescreen());
        },
      ),
    );
  }
}
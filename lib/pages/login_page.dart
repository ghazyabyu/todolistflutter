import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/controllers/authcontroller.dart';
import 'package:todolistflutter/pages/login/login_mobile.dart';
import 'package:todolistflutter/pages/login/login_widescreen.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
         return Obx(()=> controller.isMobile.value ? LoginMobile() : LoginWidescreen());
        },
      ),
    );
  }
}
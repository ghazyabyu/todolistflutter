import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    final splashC = Get.put(SplashController());
    return Scaffold(
      body: Center(child: Container(
        child: Text("SPLASH SCREEN"),
      ),),
    );
  }
}
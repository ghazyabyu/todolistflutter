import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/components/customcolor.dart';
import 'package:todolistflutter/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    final splashC = Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColors.softYellow,
      body: Center(child: Container(
        child:  Icon(Icons.checklist_sharp, size: 80, color:const Color.fromARGB(255, 157, 190, 154)),
      ),),
    );
  }
}
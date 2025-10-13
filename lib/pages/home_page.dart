import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/controllers/todocontroller.dart';
import 'package:todolistflutter/pages/home/home_mobile.dart';
import 'package:todolistflutter/pages/home/home_widescreen.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
         return Obx(()=> controller.isMobile.value ? HomeMobile() : HomeWidescreen());
        },
      ),
    );
  }
}
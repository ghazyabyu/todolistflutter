import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/controllers/todocontroller.dart';
import 'package:todolistflutter/pages/todo/todo_mobile.dart';
import 'package:todolistflutter/pages/todo/todo_widescreen.dart';

class Todopage extends StatelessWidget {
   Todopage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
         return Obx(()=> controller.isMobile.value ? TodoMobile() : TodoWidescreen());
        },
      ),
    );
  }
}
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:todolistflutter/controllers/historycontroller.dart';
  import 'package:todolistflutter/pages/history/history_mobile.dart';
  import 'package:todolistflutter/pages/history/history_widescreen.dart';

  class HistoryPage extends StatelessWidget {
    HistoryPage({super.key});


    @override
    Widget build(BuildContext context) {

      final controller = Get.find<HistoryController>();
      
      return Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            controller.updateLayout(constraints);
          return Obx(()=> controller.isMobile.value ? HistoryMobile() : HistoryWidescreen());
          },
        ),
      );
    }
  }
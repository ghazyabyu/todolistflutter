import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/bindings/dashboardbinding.dart';
import 'package:todolistflutter/controllers/dashboardcontroller.dart';
import '../components/customcolor.dart';


class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final DashboardController dash =  Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: dash
                  .pages[dash.selectedIndex.value],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dash.selectedIndex.value,
          onTap: dash.changePage,
          selectedItemColor:AppColors.darkgreen,
          unselectedItemColor: Colors.grey,
          backgroundColor: AppColors.lightGreen,
          items: const [
             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

            BottomNavigationBarItem(icon:Icon(Icons.history), label: "History",),
           
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

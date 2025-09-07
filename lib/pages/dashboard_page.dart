import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/bindings/dashboardbinding.dart';
import 'package:todolistflutter/controllers/dashboardcontroller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final DashboardController dash =  Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text("Dashboard")),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Selamat datang di Dashboard 🎉",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: dash
                  .pages[dash.selectedIndex.value],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dash.selectedIndex.value,
          onTap: dash.changePage,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon:Icon(Icons.history), label: "History",),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

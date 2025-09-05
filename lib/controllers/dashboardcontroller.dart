import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todolistflutter/pages/history_page.dart';
import 'package:todolistflutter/pages/home_page.dart';
import 'package:todolistflutter/pages/profile_page.dart';


class DashboardController extends GetxController {
  var selectedIndex = 0.obs; 

  
  final List<Widget> pages = [
    HistoryPage(),
    HomePage(),
    ProfilePage()];

  void changePage(int index) {  
    selectedIndex.value = index;
  }
}
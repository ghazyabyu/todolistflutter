import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todolistflutter/bindings/authbinding.dart';
import 'package:todolistflutter/pages/login_page.dart';
import 'package:todolistflutter/routes/routes.dart';
import 'package:todolistflutter/routes/pages.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // <-- ini harus ada const
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginpage,
      getPages: AppPages.pages,
    );
  }
}


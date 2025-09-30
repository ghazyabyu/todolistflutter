import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/bindings/authbinding.dart';
import 'package:todolistflutter/routes/pages.dart';
import 'package:todolistflutter/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashpage, 
      getPages: AppPages.pages,
      initialBinding: AuthBinding(),
    );
  }
}

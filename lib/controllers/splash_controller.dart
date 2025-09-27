import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistflutter/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2)); 
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString("username");

    if (username != null) {
      Get.offAllNamed(AppRoutes.dashboardpage);
    } else {
      Get.offAllNamed(AppRoutes.loginpage);
    }
  }
}


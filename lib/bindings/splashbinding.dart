import 'package:get/get.dart';
import 'package:todolistflutter/controllers/splash_controller.dart';
import '../controllers/historycontroller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
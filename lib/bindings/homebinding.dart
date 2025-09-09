import 'package:get/get.dart';
import '../controllers/homecontroller.dart';
import '../controllers/todocontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

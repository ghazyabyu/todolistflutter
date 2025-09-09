import 'package:get/get.dart';
import 'package:todolistflutter/controllers/dashboardcontroller.dart';
import 'package:todolistflutter/controllers/todocontroller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}

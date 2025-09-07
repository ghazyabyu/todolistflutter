import 'package:get/get.dart';
import 'package:todolistflutter/controllers/dashboardcontroller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<DashboardController>(() => DashboardController());
  }
}

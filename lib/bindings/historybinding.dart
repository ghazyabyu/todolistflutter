import 'package:get/get.dart';
import 'package:todolistflutter/controllers/todocontroller.dart';
import '../controllers/historycontroller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}

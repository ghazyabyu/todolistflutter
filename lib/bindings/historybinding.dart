import 'package:get/get.dart';
import '../controllers/historycontroller.dart';

class Historybinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Historycontroller>(() => Historycontroller());
  }
}

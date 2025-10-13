import 'package:get/get.dart';
import 'package:todolistflutter/controllers/profilecontroller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Profilecontroller>(() => Profilecontroller());
  }
}
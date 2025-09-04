import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  final String dummyUsername = "admin";
  final String dummyPassword = "12345";

  bool login(String username, String password) {
    if (username == dummyUsername && password == dummyPassword) {
      isLoggedIn.value = true;
      return true;
    }
    return false;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}

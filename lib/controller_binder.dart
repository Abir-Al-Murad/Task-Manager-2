
import 'package:get/get.dart';
import 'package:taskmanager2/controllers/login_controller.dart';
import 'package:taskmanager2/controllers/sign_up_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
      Get.put(SignUpContoller());
      Get.put(LoginController());
  }
}
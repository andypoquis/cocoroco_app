
import 'package:get/get.dart';
import '../controllers/signin_controller.dart';


class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() => SigninController());
  }
}
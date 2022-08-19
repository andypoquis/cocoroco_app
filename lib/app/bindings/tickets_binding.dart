
import 'package:get/get.dart';
import '../controllers/tickets_controller.dart';


class TicketsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketsController>(() => TicketsController());
  }
}
import 'package:cocoroco/app/controllers/general_controller.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final _controllerGeneral = Get.put(GeneralController());

  RxInt indexProduct = 0.obs;
  naviationProductDetailPage(int index) {
    indexProduct.value = index;
    //Get.toNamed(Routes.PRODUCT_DETAIL);
  }
}

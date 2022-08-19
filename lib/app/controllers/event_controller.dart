import 'package:cocoroco/app/routes/app_pages.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  RxString idEvent = ''.obs;

  naviationTicketsPage() {
    Get.toNamed(Routes.TICKETS);
  }

  naviationProductsPage() {
    Get.toNamed(Routes.PRODUCTS);
  }

  selectNavigationPage(ruthPage) {
    switch (ruthPage) {
      case "Products":
        return naviationProductsPage();

      case "Tickets":
        naviationTicketsPage();
        break;
      default:
    }
  }
}

class MenuOptions {
  // ignore: non_constant_identifier_names
  String PRODUCTS_PAGE = "Products";
  // ignore: non_constant_identifier_names
  String TICKETS_PAGE = "Tickets";
}

import 'package:cocoroco/app/bindings/event_binding.dart';
import 'package:cocoroco/app/bindings/home_binding.dart';
import 'package:cocoroco/app/bindings/products_binding.dart';
import 'package:cocoroco/app/bindings/signin_binding.dart';
import 'package:cocoroco/app/bindings/signup_binding.dart';
import 'package:cocoroco/app/bindings/tickets_binding.dart';
import 'package:cocoroco/app/ui/pages/event_page/event_page.dart';
import 'package:cocoroco/app/ui/pages/home_page/home_page.dart';
import 'package:cocoroco/app/ui/pages/products_page/product_detail_page.dart';
import 'package:cocoroco/app/ui/pages/products_page/products_page.dart';
import 'package:cocoroco/app/ui/pages/signin_page/signin_page.dart';
import 'package:cocoroco/app/ui/pages/tickets_page/tickets_page.dart';
import 'package:get/get.dart';

import '../ui/pages/signup_page/signup_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: Routes.EVENT, page: () => EventPage(), binding: EventBinding()),
    GetPage(
        name: Routes.TICKETS,
        page: () => TicketsPage(),
        binding: TicketsBinding()),
    GetPage(
        name: Routes.PRODUCTS,
        page: () => ProductsPage(),
        binding: ProductsBinding()),
    GetPage(
        name: Routes.PRODUCT_DETAILS,
        page: () => ProductDetailPage(),
        bindings: [ProductsBinding()]),
    GetPage(
        name: Routes.SIGN_IN,
        page: () => SigninPage(),
        binding: SigninBinding()),
    GetPage(
        name: Routes.SIGN_UP,
        page: () => SignupPage(),
        binding: SignupBinding()),
  ];
}

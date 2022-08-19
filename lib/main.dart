import 'package:cocoroco/app/bindings/home_binding.dart';
import 'package:cocoroco/app/bindings/signin_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/ui/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    initialBinding: SigninBinding(),
    getPages: AppPages.pages,
    initialRoute: GetStorage().read('success') == null
        ? Routes.SIGN_IN
        : !GetStorage().read('success')
            ? Routes.SIGN_IN
            : Routes.HOME,
  ));
}

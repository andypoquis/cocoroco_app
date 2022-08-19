import 'package:cocoroco/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SigninController extends GetxController {
  RxBool isLoading = false.obs;
  GetStorage box = GetStorage();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signin() async {
    try {
      isLoading.value = true;

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (userCredential.user?.uid != null) {
        box.write('success', true);
        box.write('uid', userCredential.user!.uid);
        Get.toNamed(Routes.HOME);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } finally {
      isLoading.value = false;
    }
  }

  naviationSignUpPage() => Get.toNamed(Routes.SIGN_UP);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoroco/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  GetStorage box = GetStorage();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();

  //Create new user account
  Future<void> createNewUser(String uid) async =>
      await FirebaseFirestore.instance.collection('user').doc(uid).set({
        'birthday': '2002-02-11',
        'createAt': DateTime.now(),
        'gender': 'M',
        'name': nameController.text,
      });

  Future<void> signup() async {
    try {
      isLoading.value = true;

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (userCredential.user?.uid != null) {
        box.write('success', true);
        box.write('uid', userCredential.user!.uid);
        await createNewUser(userCredential.user!.uid);
        Get.offAllNamed(Routes.HOME);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}

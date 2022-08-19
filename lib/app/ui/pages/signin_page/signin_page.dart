import 'package:cocoroco/app/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/signin_controller.dart';

class SigninPage extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            Expanded(child: Container()),
            const Text('Bienvenido a',
                style: TextStyle(
                  height: 0,
                  letterSpacing: 0,
                  color: primaryTextColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                )),
            const Text('Cocoroco',
                style: TextStyle(
                  height: 0,
                  letterSpacing: 0,
                  color: primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                )),
            Expanded(child: Container()),
            TextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: 'Email',
                  filled: true,
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: 'Password',
                  filled: true,
                )),
            Expanded(child: Container()),
            SizedBox(
              width: size.width,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: primaryColor,
                ),
                onPressed: controller.signin,
                child: Obx(() => !controller.isLoading.value
                    ? const Text(
                        'Ingresar',
                        style: TextStyle(
                            color: primaryTextColor,
                            fontWeight: FontWeight.w500),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => controller.naviationSignUpPage(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '¿No tienes una cuenta?',
                    style: TextStyle(
                      color: primaryTextColor,
                    ),
                  ),
                  Text(
                    ' Registrate',
                    style: TextStyle(color: primaryColor),
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            const Center(
              child: Text(
                'O ingresa con',
                style: TextStyle(
                  color: primaryTextColor,
                ),
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.42,
                  height: 55,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: const Color(0xFF345288),
                      ),
                      onPressed: () {},
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              'assets/facebook_icon.png',
                              height: 25,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Facebook',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  width: size.width * 0.42,
                  height: 55,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.white,
                      ),
                      onPressed: controller.signin,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              'assets/google_icon.png',
                              height: 25,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Google',
                              style: TextStyle(
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Expanded(child: Container()),
          ],
        ),
      )),
    );
  }
}

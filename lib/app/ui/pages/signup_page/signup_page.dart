import 'package:cocoroco/app/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/signup_controller.dart';

class SignupPage extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Crear una nueva cuenta'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Expanded(child: Container()),
            inputTextWdiget('Nombre', TextInputType.name, false, Icons.person,
                controller.nameController),
            const SizedBox(
              height: 20,
            ),
            inputTextWdiget('Email', TextInputType.emailAddress, false,
                Icons.email, controller.emailController),
            const SizedBox(
              height: 20,
            ),
            inputTextWdiget('Contraseña', TextInputType.visiblePassword, true,
                Icons.lock, controller.passwordController),
            const SizedBox(
              height: 20,
            ),
            inputTextWdiget('Repetir contraseña', TextInputType.visiblePassword,
                true, Icons.lock, controller.passwordRepeatController),
            Expanded(child: Container()),
            SizedBox(
              width: size.width,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: primaryColor,
                ),
                onPressed: controller.signup,
                child: Obx(() => !controller.isLoading.value
                    ? const Text(
                        'Registrarse',
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
            Expanded(child: Container()),
            Expanded(child: Container()),
            const Center(
              child: Text(
                'O Registrarse con',
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
                      onPressed: () {},
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
          ]),
        ),
      ),
    );
  }

  Widget inputTextWdiget(
      String hintText,
      TextInputType inputType,
      bool obscureText,
      IconData icon,
      TextEditingController textEditingController) {
    return TextField(
        controller: textEditingController,
        obscureText: obscureText,
        keyboardType: inputType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: hintText,
          filled: true,
        ));
  }
}

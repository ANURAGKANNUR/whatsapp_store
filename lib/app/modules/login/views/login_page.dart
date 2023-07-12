import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_store/app/modules/login/controller/login_controller.dart';

import '../../../routes/app_pages.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});
  var isObscure = true.obs;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, right: 20, left: 20),
          child: Form(
            key: _formKey,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome to",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Text(
                  "WhatsAppShop",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: controller.usernameController,
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter proper name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "  Enter Email/Mobile Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 25),
                      fillColor: Colors.grey[200]),
                ),
                const SizedBox(height: 20),
                Obx(() => TextFormField(
                  controller: controller.passwordController,
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter the password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "  Enter the Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          suffixIcon: Obx(() => GestureDetector(
                                onTap: () {
                                  isObscure.value = !isObscure.value;
                                },
                                child: Icon(isObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )),
                          contentPadding: const EdgeInsets.symmetric(vertical: 25),
                          fillColor: Colors.grey[200]),
                      obscureText: isObscure.value,
                      obscuringCharacter: '*',
                    )),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          // controller.loginCall(controller.usernameController.text, controller.passwordController.text);
                          controller.loginCall('kminchelle', '0lelplR');
                          Get.toNamed(Routes.profilePage);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: Colors.black,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    )),
                SizedBox(height: 50,),
                Center(
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have any Account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        )
                      ),
                      TextSpan(
                        text: "  REGISTER",
                        style: TextStyle(
                          color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold
                        )
                      )
                    ]
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

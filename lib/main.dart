import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_store/app/app.dart';
import 'package:whatsapp_store/app/modules/login/controller/login_controller.dart';

void main() {
  final loginController =Get.put(LoginController());
  loginController.checkLoginStatus();
  runApp(App());
}

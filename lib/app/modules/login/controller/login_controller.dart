import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_store/app/modules/profile/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../../../models/user_model.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final RxBool isLoggedIn = false.obs;
  final Rx<User> user = User().obs;
  final profileController=Get.put(ProfileController());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginCall(username, password) async {
    const uri = 'https://dummyjson.com/auth/login';
    var params = {'username': username, 'password': password};
    try {
      var response = await http.post(
        Uri.parse(uri),
        body: params,
      );
      if(response.statusCode !=200){
        Get.snackbar('Invalid password', '');
      }
      else{
        EasyLoading.show();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        final data = jsonDecode(response.body);
        user.value = User.fromJson(data);
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('user', jsonEncode(user.toJson()));
        user.refresh();
        profileController.getUserDetails();
        Get.offNamed(Routes.profilePage);
        EasyLoading.dismiss();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('user');
    isLoggedIn.value = false;
    Get.offAllNamed(Routes.loginPage);
  }

  checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('isLoggedIn')==true){
      profileController.getUserDetails();
      Get.toNamed(Routes.profilePage);
    }
    else{
      Get.toNamed(Routes.loginPage);
    }

  }
}

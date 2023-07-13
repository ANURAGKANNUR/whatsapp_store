import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_store/app/modules/login/controller/login_controller.dart';

import '../../../models/user_model.dart';

class ProfileController extends GetxController {
  var user = User().obs;
  // @override
  // onInit() {
  //   getUserDetails();
  //   super.onInit();
  // }

  getUserDetails() async {
    EasyLoading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDetails = jsonDecode(prefs.getString('user')!);
    user.value = User.fromJson(userDetails);
    print(user.value.firstName);
    EasyLoading.dismiss();
  }



}

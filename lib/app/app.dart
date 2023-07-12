import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:whatsapp_store/app/routes/app_pages.dart';




class App extends StatelessWidget {
   App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "WhatsAppShop",

      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}

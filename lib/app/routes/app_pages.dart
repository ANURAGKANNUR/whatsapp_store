import 'package:get/get.dart';
import 'package:whatsapp_store/app/modules/login/binding/login_binding.dart';
import 'package:whatsapp_store/app/modules/login/views/login_page.dart';
import 'package:whatsapp_store/app/modules/products/binding/product_binding.dart';
import 'package:whatsapp_store/app/modules/products/views/product_page.dart';
import 'package:whatsapp_store/app/modules/profile/binding/profile_binding.dart';
import 'package:whatsapp_store/app/modules/profile/views/profile_page.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.loginPage;

  static final routes = [
    GetPage(
        name: _Paths.loginPage,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: _Paths.productPage,
        page: () => ProductPage(),
        binding: ProductBinding()),
    GetPage(name: _Paths.profilePage, page: ()=>ProfilePage(),binding: ProfileBinding())
  ];
}

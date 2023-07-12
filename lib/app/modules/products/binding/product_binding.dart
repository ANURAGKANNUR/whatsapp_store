


import 'package:get/get.dart';
import 'package:whatsapp_store/app/modules/products/controller/product_controller.dart';

class ProductBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
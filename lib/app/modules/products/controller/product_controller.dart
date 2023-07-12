import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp_store/app/api_call.dart';

import '../../../models/all_product_model.dart';
import '../../../models/single_product_model.dart';

class ProductController extends GetxController {

  var allProducts=AllProduct().obs;
  var productDtail=SingleProduct().obs;
  var selectedNumber = 1.obs;

  void updateSelectedNumber( number) {
    selectedNumber.value = number;
  }
final _apiCall=ApiCall();
  @override
  onInit() {
    getAllProduct();
    super.onInit();
  }

 getAllProduct() async {

    try{
      EasyLoading.show();
      var response=await _apiCall.getProductAllProducts();
      var producrdetails=await _apiCall.getProductDetail();
      allProducts.value=response;
      productDtail.value=producrdetails;
      EasyLoading.dismiss();

    }
    catch(e){
      print(e);
    }
  }




}

import 'dart:convert';

import 'models/all_product_model.dart';
import 'package:http/http.dart' as http;

import 'models/single_product_model.dart';
class ApiCall{

  Future<AllProduct> getProductAllProducts() async {
    final response =
    await http.get(Uri.parse('https://dummyjson.com/products'));
    final  data=jsonDecode(response.body);
    return AllProduct.fromJson(data);
  }

  Future<SingleProduct> getProductDetail() async {
    final response =
    await http.get(Uri.parse('https://dummyjson.com/products/1'));
    final data=jsonDecode(response.body);
    return SingleProduct.fromJson(data);
  }
}
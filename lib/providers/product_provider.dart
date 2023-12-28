import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:road_mate/models/product_details_hive.dart';
import 'package:road_mate/models/product_model.dart';
import 'package:road_mate/repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider(this.productRespository) {
    getAllproducts();
  }
  List<Product> products = [];
  bool isLoading = false;
  bool isDetailsLoading = false;
  ProductDetailHive? viewingProduct;
  ProductRespository productRespository;
  bool showMessage = false;

  void getAllproducts() async {
    try {
      isLoading = true;
      notifyListeners();
      Response response = await productRespository.getAllProducts();

      if (response.statusCode == 200) {
        List<dynamic> tempResponse = json.decode(response.data)["product"];

        products = tempResponse.map((e) => Product.fromJson(e)).toList();
      } else {
// From here we can initiate the error handling. I havent implemented that.
      }
    } catch (e) {
// From here we can handle the exceptions.
    }
    isLoading = false;
    notifyListeners();
  }

  void getProductById(int id) async {
    try {
      isDetailsLoading = true;
      await Future.delayed(const Duration(milliseconds: 200));
      notifyListeners();
      Response response = await productRespository.getProductById(id: id);

      if (response.statusCode == 200) {
        List<dynamic> tempResponse = (response.data)["productdetails"];

        viewingProduct = tempResponse
            .map((e) => ProductDetailHive.fromJson(e))
            .toList()
            .first;
      } else {}
    } catch (e) {
      // exceptions has to be handled from here, not implemented.
    }
    isDetailsLoading = false;
    notifyListeners();
  }
}

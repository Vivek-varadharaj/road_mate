import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:road_mate/models/product_details_hive.dart';

class CartProvider extends ChangeNotifier {
  CartProvider() {
    getAllCartProducts();
  }
  Box<List<dynamic>>? box;
  List<ProductDetailHive> cart = [];
  bool isCartScreenLoading = false;
  bool isButtonLoading = false;

  getAllCartProducts() async {
    isCartScreenLoading = true;
    notifyListeners();
    box = await Hive.openBox("cart");
    cart = box?.get("cart")?.cast<ProductDetailHive>() ?? <ProductDetailHive>[];

    notifyListeners();
  }

  addProductToCart(ProductDetailHive product) async {
    isButtonLoading = true;
    notifyListeners();

    if (cart.where((element) => element.id == product.id).isNotEmpty) {
      cart.removeWhere(
        (element) => element.id == product.id,
      );
      await box?.put("cart", cart);
    } else {
      cart.add(product);

      await box?.put("cart", cart);
    }

    isButtonLoading = false;
    notifyListeners();
  }
}

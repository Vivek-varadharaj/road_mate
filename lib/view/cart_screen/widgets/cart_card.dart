import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:road_mate/models/product_details_hive.dart';
import 'package:road_mate/providers/cart_provider.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.product});
  final ProductDetailHive product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(product.productName)),
       const SizedBox(
          width: 16,
        ),
        IconButton(
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addProductToCart(product);
            },
            icon: const Icon(Icons.cancel))
      ],
    );
  }
}

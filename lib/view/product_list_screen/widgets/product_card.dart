import 'package:flutter/material.dart';
import 'package:road_mate/models/product_model.dart';
import 'package:road_mate/view/product_details_screen.dart/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailsScreen( id: product.id,),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(product.productName),
      ),
    );
  }
}

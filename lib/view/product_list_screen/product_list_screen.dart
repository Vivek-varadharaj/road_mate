import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:road_mate/providers/product_provider.dart';
import 'package:road_mate/view/cart_screen/cart_screen.dart';

import 'package:road_mate/view/product_list_screen/widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
          builder: (context, productProvider, child) =>
              productProvider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: productProvider.products.length,
                            itemBuilder: (context, index) => ProductCard(
                                product: productProvider.products[index]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ));
                                },
                                child: Text("View Cart")),
                          ),
                        )
                      ],
                    )),
    );
  }
}

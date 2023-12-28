import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:road_mate/providers/cart_provider.dart';
import 'package:road_mate/providers/product_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});
  final int id;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false)
        .getProductById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ProductProvider>(
            builder: (context, productProvider, child) => productProvider
                    .isDetailsLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(20),
                          children: [
                            Text(
                              productProvider.viewingProduct?.productName ?? "",
                              style: const TextStyle(
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(productProvider.viewingProduct?.description ??
                                "")
                          ],
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
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .addProductToCart(
                                        productProvider.viewingProduct!);
                              },
                              child: Consumer<CartProvider>(
                                builder: (context, value, child) => Text(
                                  value.isButtonLoading
                                      ? "......"
                                      : value.cart
                                              .where(
                                                (element) =>
                                                    element.id ==
                                                    productProvider
                                                        .viewingProduct?.id,
                                              )
                                              .isNotEmpty
                                          ? "Remove from cart"
                                          : "Add to cart",
                                  style: const TextStyle(color: Colors.black),
                                ),
                              )),
                        ),
                      )
                    ],
                  )),
      ),
    );
  }
}

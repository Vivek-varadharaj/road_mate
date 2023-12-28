import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:road_mate/providers/cart_provider.dart';
import 'package:road_mate/view/cart_screen/widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Consumer<CartProvider>(
        builder: (context, value, child) => value.cart.isEmpty
            ? Center(
                child: Text("Empty Cart"),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: value.cart.length,
                itemBuilder: (context, index) =>
                    CartCard(product: value.cart[index]),
              ),
      )),
    );
  }
}

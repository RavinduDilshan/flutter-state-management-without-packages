import 'package:flutter/material.dart';
import 'package:pronew/cart/cart_screen.dart';
import 'package:pronew/main.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = CartContainer.of(context);
    return TextButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const CartScreen())),
        child: Row(
          children: [
            const Icon(Icons.shopping_cart),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListenableBuilder(
                  listenable: cartService,
                  builder: (context, child) =>
                      Text('cart : ${cartService.products.length}')),
            )
          ],
        ));
  }
}

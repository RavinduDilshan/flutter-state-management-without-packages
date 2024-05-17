import 'package:flutter/material.dart';
import 'package:pronew/main.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = CartContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('your cart'),
      ),
      body: ListenableBuilder(
        listenable: cartService,
        builder: (context, child) {
          if (cartService.products.isEmpty) {
            return const Center(
              child: Text('your cart is empty'),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final product = cartService.products[index];
                  return ListTile(
                    title: Text(product.name),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onPressed: () => cartService.removeProduct(product),
                    ),
                  );
                },
                separatorBuilder: (context, _) => const Divider(),
                itemCount: cartService.products.length);
          }
        },
      ),
    );
  }
}

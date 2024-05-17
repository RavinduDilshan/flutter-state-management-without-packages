import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pronew/main.dart';
import 'package:pronew/product_list/cart_button.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = ProductContainer.of(context);
    final cartService = CartContainer.of(context);
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    return Scaffold(
      appBar: AppBar(
        title: const Text('product list'),
        actions: const [CartButton()],
      ),
      body: ListenableBuilder(
        listenable: cartService,
        builder: (context, child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final product = productService.products[index];
                final isAlreadyInCart = cartService.products.contains(product);
                return ListTile(
                  title: Text(product.name),
                  leading: Icon(Icons.shopping_cart,
                      color:
                          isAlreadyInCart ? Colors.green : Colors.transparent),
                  subtitle: Text(
                    product.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.black38),
                  ),
                  trailing: Text(
                    formatter.format(product.price),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black54),
                  ),
                  onTap: isAlreadyInCart
                      ? null
                      : () => cartService.addProduct(product),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: productService.products.length);
        },
      ),
    );
  }
}

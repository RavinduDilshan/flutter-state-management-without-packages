import 'package:flutter/material.dart';
import 'package:pronew/product_list/product_list_screen.dart';
import 'package:pronew/services/cart_service.dart';
import 'package:pronew/services/product_service.dart';
import 'package:pronew/value_notifier/counter_screen.dart';
import 'package:pronew/value_notifier/counter_using_another_method.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State mangement without packages',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const CounterScreenUsingAnotherMethod(),
    );
    /* return ProductContainer(
        productService: ProductService(),
        child: CartContainer(
          cartService: CartService(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'State mangement without packages',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              useMaterial3: true,
            ),
            home: const ProductListScreen(),
          ),
        )); */
  }
}

class ProductContainer extends InheritedWidget {
  final ProductService productService;
  const ProductContainer(
      {super.key, required this.productService, required super.child});
  @override
  bool updateShouldNotify(ProductContainer oldWidget) {
    return oldWidget.productService != productService;
  }

  static ProductService of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProductContainer>()!
        .productService;
  }
}

class CartContainer extends InheritedWidget {
  final CartService cartService;
  const CartContainer(
      {super.key, required this.cartService, required super.child});
  @override
  bool updateShouldNotify(CartContainer oldWidget) {
    return oldWidget.cartService != cartService;
  }

  static CartService of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CartContainer>()!
        .cartService;
  }
}

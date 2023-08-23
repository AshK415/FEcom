import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  static ShopScreen builder(BuildContext context, GoRouterState state) =>
      const ShopScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text('Welcome to E-cart'),
        ),
      ),
    );
  }
}

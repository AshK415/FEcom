import 'package:flutter/material.dart';
import 'package:flutter_ecom/src/features/common/common.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static SplashScreen builder(BuildContext context, GoRouterState state) =>
      const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Image(image: AssetImage(appIcon)),
            20.0.hspace,
            const Text(
              'ECom',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

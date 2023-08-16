import 'package:flutter/material.dart';
import 'package:flutter_ecom/src/shared/theme/app_theme_mode.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static ProfileScreen builder(BuildContext context, GoRouterState state) =>
      const ProfileScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              ref.read(appThemeModeProvider.notifier).toggle();
            },
            child: Text(Theme.of(context).brightness == Brightness.light
                ? 'Enable Dark Theme'
                : 'Enable Light Theme')),
      ),
    );
  }
}

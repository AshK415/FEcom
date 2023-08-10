import 'package:flutter/material.dart';
import 'package:flutter_ecom/src/features/auth/presentation/providers/providers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  static AuthScreen builder(BuildContext context, GoRouterState state) =>
      const AuthScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Flutter ECom'),
            const SizedBox(
              height: 12,
            ),
            authState.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (data) {
                return ElevatedButton(
                  onPressed: () {
                    ref.read(authNotifierProvider.notifier).googleSignIn();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.google),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Sign In with Google')
                    ],
                  ),
                );
              },
              error: (error, stackTrace) {
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

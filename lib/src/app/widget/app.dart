import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(appRouteProvider);
    final lightTheme = FlexThemeData.light(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scheme: FlexScheme.bigStone);
    final darkTheme = FlexThemeData.dark(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scheme: FlexScheme.bigStone);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: route,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:flutter_ecom/src/shared/theme/app_theme_mode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(appRouteProvider);
    final appDarkTheme = ref.watch(appThemeModeProvider);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, widget) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: appDarkTheme ? ThemeMode.dark : ThemeMode.light,
              routerConfig: route,
              restorationScopeId: 'FEcommerce');
        });
  }
}

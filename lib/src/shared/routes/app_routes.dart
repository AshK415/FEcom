import 'package:flutter_ecom/src/features/auth/auth.dart';
import 'package:flutter_ecom/src/shared/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'routes_location.dart';

part 'app_routes.g.dart';

@riverpod
GoRouter appRoute(AppRouteRef ref) {
  final authState = ref.watch(authStateChangesProvider);
  return GoRouter(
    navigatorKey: navigationKey,
    initialLocation: RoutesLocation.splash,
    debugLogDiagnostics: true,
    routes: routes,
    redirect: (context, state) {
      if (authState.isLoading || authState.hasError) return null;
      final isAuth = authState.valueOrNull != null;
      final isSplash = state.matchedLocation == RoutesLocation.splash;
      if (isSplash) {
        return isAuth ? RoutesLocation.shop : RoutesLocation.auth;
      }
      final isLoggedIn = state.matchedLocation == RoutesLocation.auth;
      if (isLoggedIn) return isAuth ? RoutesLocation.shop : null;
      return isAuth ? null : RoutesLocation.splash;
    },
  );
}

import 'package:flutter/widgets.dart';
import 'package:flutter_ecom/src/features/account/account.dart';
import 'package:flutter_ecom/src/features/auth/auth.dart';
import 'package:flutter_ecom/src/features/cart/cart.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:go_router/go_router.dart';
import './routes_location.dart';

final navigationKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = [
  GoRoute(
    path: RoutesLocation.splash,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => SplashScreen.builder(context, state),
  ),
  GoRoute(
    path: RoutesLocation.auth,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => AuthScreen.builder(context, state),
  ),
  // GoRoute(
  //   path: RoutesLocation.,
  //   parentNavigatorKey: navigationKey,
  //   builder: (context, state) => const HomeScreen(),
  // )
  // Bottom Nav bar shell
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return BottomNavBarShell.builder(context, state, child);
      },
      routes: [
        GoRoute(
          path: RoutesLocation.shop,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ShopScreen.builder(context, state),
            );
          },
        ),
        GoRoute(
          path: RoutesLocation.explore,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ExploreScreen.builder(context, state),
            );
          },
        ),
        GoRoute(
          path: RoutesLocation.cart,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: CartScreen.builder(context, state),
            );
          },
        ),
        GoRoute(
          path: RoutesLocation.favourite,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: FavouriteScreen.builder(context, state),
            );
          },
        ),
        GoRoute(
          path: RoutesLocation.profile,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: AccountsScreen.builder(context, state),
            );
          },
        ),
      ]),
];

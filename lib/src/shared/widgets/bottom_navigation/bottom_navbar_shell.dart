import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/src/shared/routes/routes_location.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavBarShell extends HookConsumerWidget {
  const BottomNavBarShell(
      {super.key, required this.child, required this.currentRoute});

  final Widget child;
  final String currentRoute;

  static BottomNavBarShell builder(
          BuildContext context, GoRouterState state, Widget child) =>
      BottomNavBarShell(currentRoute: state.matchedLocation, child: child);

  bool _isItemSelected(String route) {
    return currentRoute.startsWith(route);
  }

  int _getIdx(String route) {
    final routes = [
      RoutesLocation.shop,
      RoutesLocation.explore,
      RoutesLocation.cart,
      RoutesLocation.favourite,
      RoutesLocation.profile
    ];
    return routes.indexOf(route);
  }

  String _getPath(int idx) {
    final routes = [
      RoutesLocation.shop,
      RoutesLocation.explore,
      RoutesLocation.cart,
      RoutesLocation.favourite,
      RoutesLocation.profile
    ];
    return routes[idx];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIdx = useState(_getIdx(currentRoute));

    ref.listen(networkStateProvider, (previous, next) {
      next.whenOrNull(data: (res) {
        debugPrint('Network State: ${res.name}');
        switch (res) {
          case NState.disconnected:
            Flushbar(
              //title: 'Connectivity',
              message: 'No Internet Connection',
              backgroundColor: Colors.red,

              messageColor: Colors.white,
            ).show(context);
            break;
          case NState.restored:
            Flushbar(
              message: 'Connection Restored',
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.green,
              messageColor: Colors.white,
            ).show(context);
            break;
          default:
        }
      });
    });

    return WillPopScope(
      onWillPop: () async {
        if (currentIdx.value != 0) {
          currentIdx.value = 0;
          context.go(_getPath(0));
          return false;
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            child,
          ],
        ),
        bottomNavigationBar: NavigationBar(
            elevation: 4,
            selectedIndex: currentIdx.value,
            onDestinationSelected: (value) {
              currentIdx.value = value;
              context.go(_getPath(value));
            },
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  shopIcon,
                  colorFilter: ColorFilter.mode(
                      _getIconColor(_isItemSelected('/shop'), context),
                      BlendMode.srcIn),
                ),
                label: 'Shop',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  exploreIcon,
                  colorFilter: ColorFilter.mode(
                      _getIconColor(_isItemSelected('/explore'), context),
                      BlendMode.srcIn),
                ),
                label: 'Explore',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  cartIcon,
                  colorFilter: ColorFilter.mode(
                      _getIconColor(_isItemSelected('/cart'), context),
                      BlendMode.srcIn),
                ),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  favoriteIcon,
                  colorFilter: ColorFilter.mode(
                      _getIconColor(_isItemSelected('/favourite'), context),
                      BlendMode.srcIn),
                ),
                label: 'Favourite',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  profileIcon,
                  colorFilter: ColorFilter.mode(
                      _getIconColor(_isItemSelected('/profile'), context),
                      BlendMode.srcIn),
                ),
                label: 'Account',
              ),
            ]),
      ),
    );
  }

  Color _getIconColor(bool isActive, BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    if (isDarkTheme) {
      if (isActive) {
        return Colors.black;
      } else {
        return Colors.white38;
      }
    } else {
      if (isActive) {
        return Colors.black;
      } else {
        return Colors.black87;
      }
    }
  }
}

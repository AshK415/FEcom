import 'package:flutter/material.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/common.dart';

class AccountsScreen extends HookConsumerWidget {
  const AccountsScreen({super.key});

  static AccountsScreen builder(BuildContext context, GoRouterState state) =>
      const AccountsScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sList = [
      {'name': 'Orders', 'icon': orderIcon},
      {'name': 'My Details', 'icon': detailsIcon},
      {'name': 'Delivery Address', 'icon': addressIcon},
      {'name': 'Payment Methods', 'icon': paymentIcon},
      {'name': 'Promo code', 'icon': promoIcon},
      {'name': 'Notifications', 'icon': notificationIcon},
      {'name': 'Help', 'icon': helpIcon},
      {'name': 'About', 'icon': aboutIcon},
    ];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // User Section
            // Settings Section
            30.0.hspace,
            1.0.div,
            ...sList.map(
              (e) => ListTile(
                trailing: SvgPicture.asset(
                  backArrowIcon,
                  width: 16,
                  height: 16,
                  color: Colors.white,
                ),
                leading: SvgPicture.asset(
                  e['icon']!,
                  color: Colors.white,
                ),
                title: Text(e['name']!),
                onTap: () {},
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              ),
            ),
            // Logout Button
          ],
        ),
      )),
    );
  }
}

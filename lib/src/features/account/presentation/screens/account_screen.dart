import 'package:flutter/material.dart';
import 'package:flutter_ecom/src/features/auth/auth.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:flutter_ecom/src/shared/theme/app_theme_mode.dart';
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
    final tmode = ref.watch(appThemeModeProvider);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // User Section
            // Settings Section
            30.0.hspace,
            1.0.div,
            ...sList
                .map<Widget>(
                  (e) => ListTile(
                    trailing: SvgPicture.asset(
                      backArrowIcon,
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          BlendMode.srcIn),
                    ),
                    leading: SvgPicture.asset(
                      e['icon']!,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          BlendMode.srcIn),
                    ),
                    title: Text(e['name']!),
                    onTap: () {},
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  ),
                )
                .insertBetween(1.0.div),
            1.0.div,
            SwitchListTile.adaptive(
              value: tmode,
              secondary: const Icon(Icons.brightness_4_rounded),
              onChanged: (_) {
                ref.read(appThemeModeProvider.notifier).toggle();
              },
              title: const Text('Toggle theme'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
            ),
            1.0.div,
            // Logout Button
            50.0.hspace,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: AppButton(
                  text: 'Logout',
                  leading: SvgPicture.asset(
                    logOutIcon,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  buttonColor: Theme.of(context).primaryColor,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (cc) => AlertDialog(
                              title: const Text('Logout'),
                              content: const Text(
                                  'Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    cc.pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ref
                                        .read(authNotifierProvider.notifier)
                                        .signOut();
                                  },
                                  style: ButtonStyle(
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(color: Colors.white)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  child: const Text('Logout'),
                                ),
                              ],
                            ));
                  }),
            )
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/cart.dart';
import 'package:t_store/features/shop/screens/profile.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/appbar.dart';
import 'package:t_store/widgets/shop/primary_header_container.dart';
import 'package:t_store/widgets/texts/section_header.dart';

import '../../../utils/constants/sizes.dart';
import '../../../widgets/list_tiles/profile_tile.dart';

import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/widgets/images/circular_image.dart';

import '../../personalization/screens/addresses.dart';
import 'orders.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderWidget(
              child: Column(
                children: [
                  TAppBar(title: Text('Account')),
                  // const SizedBox(height: TSizes.spaceBtwItems),
                  TUserProfileTile(
                    dark: dark,
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                      textColor: dark ? Colors.white : Colors.black,
                      showActionButton: false,
                      title: 'Account Settings'),
                  const SizedBox(height: TSizes.defaultSpace),
                  TSettingsMenuTile(
                    dark: dark,
                    icon: Iconsax.safe_home,
                    title: 'Adress',
                    subTitle: 'Change Delivery Adress',
                    onTap: () => Get.to(const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    dark: dark,
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'add remove products and proceed to checkout',
                    onTap: () => Get.to(const CartScreen()),
                  ),
                  TSettingsMenuTile(
                    dark: dark,
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(const OrdersScreen()),
                  ),
                  TSettingsMenuTile(
                      dark: dark,
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all discounted Coupons',
                      onTap: () {}),
                  TSettingsMenuTile(
                      dark: dark,
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'set any kind of notification message',
                      onTap: () {}),
                  TSettingsMenuTile(
                      dark: dark,
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'manage data usage and connected accounts',
                      onTap: () {}),
                  const SizedBox(height: TSizes.defaultSpace),
                  TSectionHeading(
                      textColor: dark ? Colors.white : Colors.black,
                      showActionButton: false,
                      title: 'App Settings'),
                  const SizedBox(height: TSizes.defaultSpace),
                  TSettingsMenuTile(
                      dark: dark,
                      icon: Iconsax.home,
                      title: 'Account Privacy',
                      subTitle: 'Chage Delivery Adress',
                      onTap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.dark,
  });
  final VoidCallback onTap;
  final String title, subTitle;
  final IconData icon;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title,
            style: TextStyle(color: dark ? TColors.white : TColors.black)),
        subtitle: Text(subTitle),
      ),
    );
  }
}

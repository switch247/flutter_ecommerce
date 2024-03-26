import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
                      icon: Iconsax.home,
                      title: 'Adress',
                      subTitle: 'Chage Delivery Adress',
                      onTap: () {}),
                  TSettingsMenuTile(
                      dark: dark,
                      icon: Iconsax.home,
                      title: 'Cart',
                      subTitle: 'Chage Delivery Adress',
                      onTap: () {}),
                  TSettingsMenuTile(
                      dark: dark,
                      icon: Iconsax.home,
                      title: 'My Orders',
                      subTitle: 'Chage Delivery Adress',
                      onTap: () {}),
                  TSettingsMenuTile(
                      dark: dark,
                      icon: Iconsax.home,
                      title: 'My Coupons',
                      subTitle: 'Chage Delivery Adress',
                      onTap: () {}),
                  TSettingsMenuTile(
                      dark: dark,
                      icon: Iconsax.home,
                      title: 'Account Privacy',
                      subTitle: 'Chage Delivery Adress',
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

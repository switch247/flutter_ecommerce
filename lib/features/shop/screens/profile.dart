import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/appbar.dart';
import 'package:t_store/widgets/images/circular_image.dart';
import 'package:t_store/widgets/texts/section_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(
                      dark: dark,
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(
                  showActionButton: false, title: 'Profile Information'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                  onTap: () {},
                  title: 'UserId',
                  value: 'value',
                  icon: Iconsax.copy),
              TProfileMenu(onTap: () {}, title: 'Username', value: 'value'),
              TProfileMenu(onTap: () {}, title: 'Name', value: 'value'),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(
                  showActionButton: false, title: 'Personal Information'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(onTap: () {}, title: 'EMail', value: 'value'),
              TProfileMenu(onTap: () {}, title: 'Phone Number', value: 'value'),
              TProfileMenu(onTap: () {}, title: 'Gender', value: 'value'),
              TProfileMenu(
                  onTap: () {}, title: 'Date Of Birth', value: 'value'),
              TProfileMenu(onTap: () {}, title: 'title', value: 'value'),
              const Divider(),
              Center(
                child: TextButton(
                  child: const Text('Close Account',
                      style: TextStyle(color: Colors.red)),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
    this.icon = Iconsax.arrow_right_34,
  });
  final String title, value;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 2),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                child: Icon(
              icon,
              size: 18,
            ))
          ],
        ),
      ),
    );
  }
}

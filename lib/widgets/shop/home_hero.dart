import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/widgets/home_appbar.dart';
import 'package:t_store/widgets/shop/primary_header_container.dart';
import 'package:t_store/widgets/shop/search_container.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../texts/section_header.dart';
import 'home_categories.dart';

class THomeHero extends StatelessWidget {
  const THomeHero({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TPrimaryHeaderWidget(
      child: Column(
        children: [
          // appbar
          const THomeAppbar(),
          const SizedBox(height: TSizes.spaceBtwItems),
          // searchbar
          const SearchWidget(
              text: 'Search in Store', icon: Iconsax.search_normal),
          const SizedBox(height: TSizes.spaceBtwItems),

          //  categories
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            child: Column(
              children: [
                // heading
                const TSectionHeading(
                  title: 'Popular Categories',
                  textColor: TColors.accent,
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                // categories
                const THomeCategories(),

                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

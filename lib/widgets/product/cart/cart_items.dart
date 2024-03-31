import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../product_details/product_price_text.dart';
import 'add_remove.dart';
import 'cart_item.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (_, index) => Column(
        children: [
          TCartItem(dark: dark),

          if (showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems),

          // add remove buttons
          if (showAddRemoveButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  const SizedBox(width: 70),
                  AddRemoveButton(dark: dark),
                ]),

                TProductPriceText(dark: dark, price: '257')
                // tst
              ],
            )
        ],
      ),
    );
  }
}

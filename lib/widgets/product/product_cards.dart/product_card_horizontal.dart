import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/images/rounded_image.dart';
import 'package:t_store/widgets/product/product_details/product_price_text.dart';

import '../../../features/shop/screens/product_details.dart';
import '../../../utils/constants/colors.dart';
import '../../container/rounded_container.dart';
import '../../icon/add_to_cart_plus.dart';
import '../../icon/circular_icon.dart';
import '../../texts/brand_title_verify.dart';
import '../../texts/card_title_text.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(const ProductDetailsScreen());
      },
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            // boxShadow: [TShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkGrey : TColors.white),
        child: Row(
          children: [
            // image
            TRoundedContainer(
              width: 120,
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  const TRoundedImage(
                      imageUrl: TImages.productImage1, applyImageRadius: true),
                  // discount tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      borderRadius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  // favourite button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CIrcularIcon(
                      dark: dark,
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                  // Details
                ],
              ),
            ),

            // SizedBox(width: TSizes.spaceBtwItems / 2),
            // text

            SizedBox(
              width: 185,
              child: Padding(
                  padding:
                      const EdgeInsets.only(left: TSizes.sm, top: TSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductTitleText(
                              title: 'title',
                              smallSize: true,
                            ),
                            SizedBox(height: TSizes.spaceBtwItems / 2),
                            BrandTitleVerify(
                              title: 'subtitle',
                            ),
                          ]),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // price
                          Flexible(
                              child: TProductPriceText(
                                  dark: dark, price: '35 - 45')),
                          AddToCartIcon()
                        ],
                      ),
                    ],
                  )),
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}

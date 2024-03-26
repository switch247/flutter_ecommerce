import 'package:flutter/material.dart';
import 'package:t_store/widgets/product/product_details/product_price_text.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../container/rounded_container.dart';
import '../../images/circular_image.dart';
import '../../texts/brand_title_verify.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // price &sale price tag
        Row(
          children: [
            // sale tag
            TRoundedContainer(
              borderRadius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.defaultSpace),
            TProductPriceText(
              dark: dark,
              price: '250',
              lineThrough: true,
            ),
            const SizedBox(width: TSizes.defaultSpace),
            TProductPriceText(
              dark: dark,
              price: '200',
              lineThrough: false,
            ),
          ],
        ),

        const SizedBox(height: TSizes.defaultSpace),
        // title
        Text(
          'Title',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(color: dark ? TColors.white : TColors.black),
        ),
        Row(
          children: [
            Text(
              'status ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: dark ? TColors.white : TColors.black),
            ),
            const SizedBox(width: TSizes.defaultSpace),
            Text(
              'inStock',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: dark ? TColors.white : TColors.black),
            ),
          ],
        ),

        const SizedBox(height: TSizes.defaultSpace),
        Row(
          children: [
            TCircularImage(
              height: 32,
              width: 32,
              dark: dark,
              image: TImages.shoeIcon,
              fit: BoxFit.contain,
            ),
            BrandTitleVerify(title: 'NAME  ', brandTextSize: TextSizes.medium),
          ],
        ),
        const SizedBox(height: TSizes.defaultSpace),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_verify.dart';
import '../../texts/card_title_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.dark,
    this.brand,
    this.productTitle,
  });

  final bool dark;
  final String? brand, productTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleVerify(title: 'Title'),
              Flexible(
                child: ProductTitleText(
                  title: 'product title text',
                  maxLines: 1,
                ),
              ),
              // attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Color' + '  ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextSpan(
                  text: 'green' + '  ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: 'Size' + '  ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextSpan(
                  text: '8' + '  ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ]))
            ],
          ),
        )
      ],
    );
  }
}

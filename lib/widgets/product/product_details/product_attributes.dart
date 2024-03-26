import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/container/rounded_container.dart';
import 'package:t_store/widgets/images/rounded_image.dart';
import 'package:t_store/widgets/product/product_details/product_price_text.dart';
import 'package:t_store/widgets/texts/section_header.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../chips/choice_chips.dart';
import '../../texts/card_title_text.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        // selected attribute
        TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(children: [
            Row(
              children: [
                TSectionHeading(showActionButton: false, title: 'Variation'),
                SizedBox(width: TSizes.defaultSpace),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('price : '),
                        SizedBox(width: TSizes.defaultSpace),
                        TProductPriceText(
                          dark: dark,
                          price: '250',
                          lineThrough: true,
                        ),
                        SizedBox(width: TSizes.defaultSpace),
                        TProductPriceText(
                          dark: dark,
                          price: '200',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Stock : '),
                        SizedBox(width: TSizes.defaultSpace),
                        Text('instock'),
                      ],
                    ),
                  ],
                )
              ],
            ),
            ProductTitleText(
                maxLines: 6,
                smallSize: true,
                title:
                    'description description description description description description description description description description description description description description description description ')
          ]),
        ),
        // Atributes
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(showActionButton: false, title: 'Colors'),
            SizedBox(height: TSizes.spaceBtwItems),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Blue',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Red',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(showActionButton: false, title: 'Sizes'),
            SizedBox(height: TSizes.spaceBtwItems),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: '39',
                  selected: false,
                  onSelected: (value) {},
                ),
                const SizedBox(width: 5),
                TChoiceChip(
                  text: '40',
                  onSelected: (value) {},
                ),
                const SizedBox(width: 5),
                TChoiceChip(
                  text: '41',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        //
      ],
    );
  }
}

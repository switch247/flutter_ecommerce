import 'package:flutter/material.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../layout/grid_layout.dart';
import '../texts/section_header.dart';
import 'brand_show_case.dart';
import 'product_cards.dart/product_card_vertical.dart';

class CatagoryTab extends StatelessWidget {
  const CatagoryTab({
    super.key,
    required this.dark,
    this.images = const [
      TImages.clothIcon,
      TImages.clothIcon,
      TImages.clothIcon
    ],
    this.title = 'Brand name',
    this.subTitle = '255',
  });

  final bool dark;
  final List<String> images;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TBrandShowcase(
                    title: title,
                    subTitle: subTitle,
                    dark: dark,
                    images: images),
                TSectionHeading(
                    showActionButton: true, title: 'You Might Like'),
                const SizedBox(height: TSizes.spaceBtwSections),
                TGridLayout(itemBuilder: (_, index) => ProductCardVertical())
              ],
            ),
          ),
        ]);
  }
}

import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../container/rounded_container.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.dark,
    required this.images,
    this.title = 'Brand Name',
    this.subTitle = '69',
  });

  final bool dark;
  final List<String> images;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(TSizes.sm),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(children: [
        BrandCard(image: TImages.clothIcon, title: title, subTitle: subTitle),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: images
              .map((image) =>
                  TBrandTopProductImageWidget(dark: dark, image: image))
              .toList(),
          // children: [
          //   TBrandTopProductImageWidget(
          //       dark: dark, image: TImages.productImage1),
          //   TBrandTopProductImageWidget(
          //       dark: dark, image: TImages.productImage1),
          //   TBrandTopProductImageWidget(
          //       dark: dark, image: TImages.productImage1),
          // ],
        ),
        const SizedBox(
          height: 5,
        ),
      ]),
    );
  }
}

class TBrandTopProductImageWidget extends StatelessWidget {
  const TBrandTopProductImageWidget({
    super.key,
    required this.dark,
    required this.image,
  });

  final bool dark;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: dark ? TColors.darkGrey : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}

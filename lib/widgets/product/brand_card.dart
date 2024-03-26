import 'package:flutter/material.dart';

import '../../utils/constants/enums.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../container/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_verify.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.dark,
    this.image = TImages.clothIcon,
    this.title = 'Brand Name ',
    this.subTitle = '256',
  });

  final bool dark;
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.sm),
          showBorder: true,
          backgroundColor: Colors.transparent,
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // icon
                Flexible(
                  child: TCircularImage(
                    dark: dark,
                    image: image,
                    backgroundColor: Colors.transparent,
                  ),
                ),

                // const SizedBox(width: TSizes.xs),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BrandTitleVerify(
                          title: title + ' ', brandTextSize: TextSizes.large),
                      Text(
                        subTitle + ' Products',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                )
              ]),
        ));
  }
}

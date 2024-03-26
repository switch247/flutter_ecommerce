import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/appbar.dart';
import 'package:t_store/widgets/container/rounded_container.dart';
import 'package:t_store/widgets/icon/circular_icon.dart';
import 'package:t_store/widgets/images/circular_image.dart';
import 'package:t_store/widgets/images/rounded_image.dart';
import 'package:t_store/widgets/product/brand_card.dart';
import 'package:t_store/widgets/shop/curved_edge_widget.dart';

import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/enums.dart';
import '../../../widgets/product/product_details/product_metafata.dart';
import '../../../widgets/product/product_details/rating_and_share.dart';
import '../../../widgets/texts/brand_title_verify.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
        child: Container(
      color: dark ? TColors.darkGrey : TColors.light,
      child: Stack(
        children: [
          // main large image
          SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(TSizes.productImageRadius * 2),
              child: Center(
                child: Image(image: AssetImage(TImages.productImage1)),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 30,
            left: TSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => TRoundedImage(
                        imageUrl: TImages.productImage2,
                        width: 80,
                        backgroundColor: dark ? TColors.white : TColors.dark,
                      ),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: 4),
            ),
          ),

          TAppBar(
            showBackArrow: true,
            actions: [
              CIrcularIcon(
                dark: dark,
                // backgroundColor: Colors.grey,
                icon: Iconsax.heart5,
                color: Colors.red,
              )
            ],
          ),
        ],
      ),
    ));
  }
}

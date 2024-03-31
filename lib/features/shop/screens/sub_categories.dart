import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/widgets/appbar.dart';
import 'package:t_store/widgets/container/rounded_container.dart';
import 'package:t_store/widgets/images/rounded_image.dart';
import 'package:t_store/widgets/product/product_cards.dart/product_card_horizontal.dart';
import 'package:t_store/widgets/texts/section_header.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Sub Category'), showBackArrow: true),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // banner
            TRoundedImage(
              width: double.infinity,
              height: null,
              imageUrl: TImages.promoBanner2,
              applyImageRadius: true,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TSectionHeading(showActionButton: true, title: 'sports Shirts'),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (context, index) => ProductCardHorizontal()),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}

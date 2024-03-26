import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';


import 'package:t_store/widgets/appbar.dart';
import 'package:t_store/widgets/container/rounded_container.dart';
import 'package:t_store/widgets/icon/circular_icon.dart';
import 'package:t_store/widgets/images/circular_image.dart';
import 'package:t_store/widgets/images/rounded_image.dart';
import 'package:t_store/widgets/product/brand_card.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/widgets/shop/curved_edge_widget.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/enums.dart';
import '../../../widgets/texts/brand_title_verify.dart';


import 'package:t_store/widgets/texts/section_header.dart';
import '../../../widgets/product/product_details/add_to_cart_bottom.dart';
import '../../../widgets/product/product_details/product_attributes.dart';
import '../../../widgets/product/product_details/product_images_slider.dart';
import '../../../widgets/product/product_details/product_metafata.dart';
import '../../../widgets/product/product_details/rating_and_share.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              // image slider
              ProductImageSlider(dark: dark),

              Padding(
                padding: EdgeInsets.only(
                    left: TSizes.defaultSpace,
                    right: TSizes.defaultSpace,
                    bottom: TSizes.defaultSpace),
                child: Column(
                  children: [
                    // rate and share
                    TRatingAndShare(),
                    // Price Title Stock and Brand
                    ProductMetaData(),
                    // atributes
                    TProductAttributes(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // checkout
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Checkout')),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Description
                    Column(
                      children: [
                        TSectionHeading(
                            showActionButton: false, title: 'Description'),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const ReadMoreText(
                          'description text  lorem5 description text  lorem5 description text  lorem5 description text  lorem5 description text  lorem5 description text  lorem5 description text  lorem5 description text  lorem5 description text  lorem5 description text  lorem5',
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' Show More',
                          trimExpandedText: '   Less',
                          moreStyle: TextStyle(
                              color: TColors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w800),
                          lessStyle: TextStyle(
                              color: TColors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),

                    // Reviews
                    Divider(),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TSectionHeading(
                        showActionButton: false, title: 'Reviews(120)'),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    
      bottomNavigationBar: TBottomAddToCart(),
    );
  }
}

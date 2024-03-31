import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/widgets/appbar.dart';
import 'package:t_store/widgets/layout/grid_layout.dart';
import 'package:t_store/widgets/product/brand_card.dart';
import 'package:t_store/widgets/texts/section_header.dart';

import 'package:t_store/widgets/product/product_cards.dart/product_card_vertical.dart';
import 'package:iconsax/iconsax.dart';

import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(showActionButton: false, title: 'Brands'),
              const SizedBox(height: TSizes.spaceBtwSections),
              TGridLayout(
                  mainAxisExtent: 80,
                  itemCount: 10,
                  itemBuilder: (_, index) =>
                      BrandCard(onTap: () => Get.to(BrandProducts())))
            ],
          ),
        ),
      ),
    );
  }
}

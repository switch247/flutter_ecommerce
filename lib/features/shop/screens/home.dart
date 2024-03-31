import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/widgets/texts/section_header.dart';
import '../../../widgets/layout/grid_layout.dart';
import '../../../widgets/product/product_cards.dart/product_card_vertical.dart';
import '../../../widgets/shop/home_hero.dart';
import '../../../widgets/shop/promo_slider.dart';
import 'all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(),
        // bottomNavigationBar: const NavigationMenu(),
        body: SingleChildScrollView(
      child: Column(
        children: [
          // hero
          THomeHero(),
          // carosel
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TPromoSlider(
                  banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwSections),
                TSectionHeading(
                    showActionButton: true,
                    title: 'Popular Products',
                    onPressed: () => Get.to(AllProductsScreen())),
                SizedBox(height: TSizes.spaceBtwItems),
                TGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const ProductCardVertical()),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

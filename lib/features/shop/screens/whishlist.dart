import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/appbar.dart';
import 'package:t_store/widgets/layout/grid_layout.dart';

import '../../../widgets/icon/circular_icon.dart';
import '../../../widgets/product/product_cards.dart/product_card_vertical.dart';
import 'home.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('wishList', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CIrcularIcon(
            icon: Iconsax.add,
            dark: dark,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}

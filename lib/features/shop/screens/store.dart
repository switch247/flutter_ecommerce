import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/layout/grid_layout.dart';
import 'package:t_store/widgets/tabbar.dart';
import 'package:t_store/widgets/texts/section_header.dart';
import '../../../widgets/product/cart/cart_menu_icon.dart';
import '../../../widgets/shop/search_container.dart';
import '../../../widgets/product/catagory_tab.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/product/brand_card.dart';
import '../../../widgets/appbar.dart';
import 'all_brands.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Store', style: Theme.of(context).textTheme.headlineMedium!
                  // .apply(color: TColors.grey),
                  ),
              // Text(
              //   TTexts.homeAppbarSubTitle,
              //   style: Theme.of(context)
              //       .textTheme
              //       .headlineSmall!
              //       .apply(color: TColors.white),
              // ),
            ],
          ),
          actions: [
            TCartCounterIcon(
              iconColor: dark ? TColors.white : TColors.black,
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? TColors.black : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems),

                        // searchbar
                        const SearchWidget(
                          text: 'Search in Store',
                          icon: Iconsax.search_normal,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        // featured brands
                        TSectionHeading(
                            onPressed: () => Get.to(AllBrandsScreen()),
                            showActionButton: true,
                            title: 'Featured Brands'),

                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        TGridLayout(
                            mainAxisExtent: 80,
                            itemCount: 2,
                            itemBuilder: (_, index) {
                              return BrandCard(image: TImages.clothIcon);
                            }),
                      ],
                    ),
                  ),
                  // tabs
                  bottom: const TTabbar(
                    tabs: [
                      Tab(child: Text("Sports")),
                      Tab(child: Text("Furniture")),
                      Tab(child: Text("Electronics")),
                      Tab(child: Text("Cloths")),
                      Tab(child: Text("Cosmetics")),
                    ],
                  ))
            ];
          },
          body: TabBarView(children: [
            CatagoryTab(
              dark: dark,
              title: 'NIKE',
              subTitle: '458',
              images: [TImages.clothIcon, TImages.clothIcon, TImages.clothIcon],
            ),
            CatagoryTab(
              dark: dark,
              title: 'IKEA',
              subTitle: '250',
              images: [TImages.clothIcon, TImages.clothIcon, TImages.clothIcon],
            ),
            CatagoryTab(dark: dark),
            CatagoryTab(dark: dark),
            CatagoryTab(dark: dark),
          ]),
        ),
      ),
    );
  }
}

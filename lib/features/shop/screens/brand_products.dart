import 'package:flutter/material.dart';
import 'package:t_store/widgets/product/brand_card.dart';

import '../../../utils/constants/sizes.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/product/sortable/sortable.dart';
import '../../../widgets/texts/section_header.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Brand Name'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // TSectionHeading(showActionButton: false, title: 'Brands'),
              const SizedBox(height: TSizes.spaceBtwSections),
              BrandCard(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

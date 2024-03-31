import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../container/rounded_container.dart';

class PayementMethodCard extends StatelessWidget {
  const PayementMethodCard({
    super.key,
    required this.title,
    required this.image,
  });

  final String title, image;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      child: Row(
        children: [
          TRoundedContainer(
            width: 60,
            height: 35,
            backgroundColor: dark ? TColors.light : TColors.white,
            padding: EdgeInsets.all(TSizes.sm),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

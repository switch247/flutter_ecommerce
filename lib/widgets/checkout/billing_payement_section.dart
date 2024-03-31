import 'package:flutter/material.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../cards/payement_method_card.dart';
import '../container/rounded_container.dart';
import '../texts/section_header.dart';

class TBillingPayementSection extends StatelessWidget {
  const TBillingPayementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          showActionButton: true,
          title: 'Payement Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        PayementMethodCard(
          title: 'PayPal',
          image: TImages.paypal,
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/adresses/adress_card.dart';
import 'package:t_store/widgets/container/rounded_container.dart';
import 'package:t_store/widgets/texts/section_header.dart';

import '../../utils/constants/sizes.dart';
import '../cards/payement_method_card.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          showActionButton: true,
          title: 'Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        SingleAddressCard()
      ],
    );
  }
}

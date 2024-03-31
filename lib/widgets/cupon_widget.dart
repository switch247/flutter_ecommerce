import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import 'container/rounded_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
          top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      child: Row(children: [
        Flexible(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Have a promo code? Enter here',
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        // Button
        SizedBox(
            width: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? TColors.white.withOpacity(0.5)
                      : TColors.dark.withOpacity(0.5),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                ),
                onPressed: () {},
                child: const Text('Apply')))
      ]),
    );
  }
}

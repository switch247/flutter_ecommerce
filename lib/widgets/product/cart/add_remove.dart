import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../icon/circular_icon.dart';

class AddRemoveButton extends StatelessWidget {
  const AddRemoveButton({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CIrcularIcon(
          dark: dark,
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          backgroundColor: TColors.darkGrey,
          color: dark ? TColors.white : TColors.dark,
        ),
        const SizedBox(width: TSizes.sm),
        Text('1'),
        const SizedBox(width: TSizes.sm),
        CIrcularIcon(
          dark: dark,
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          backgroundColor: TColors.primary,
          color: dark ? TColors.white : TColors.dark,
        ),
      ],
    );
  }
}

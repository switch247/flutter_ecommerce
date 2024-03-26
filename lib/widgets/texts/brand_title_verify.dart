import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/sizes.dart';

class BrandTitleVerify extends StatelessWidget {
  const BrandTitleVerify({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.brandTextSize = TextSizes.small,
    this.verified = true,
    this.icon = Iconsax.verify5,
    this.textAlign = TextAlign.center,
  });
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextSizes brandTextSize;
  final bool verified;
  final IconData icon;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: brandTextSize == TextSizes.small
                ? Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor)
                : brandTextSize == TextSizes.medium
                    ? Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: textColor)
                    : brandTextSize == TextSizes.large
                        ? Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .apply(color: textColor)
                        : Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: textColor),
          ),
        ),
        if (verified == true)
          Icon(
            icon,
            color: TColors.primary,
            size: TSizes.iconXs,
          )
      ],
    );
  }
}

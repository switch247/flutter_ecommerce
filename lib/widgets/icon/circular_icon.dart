import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CIrcularIcon extends StatelessWidget {
  final double? width, height;
  final IconData icon;
  final double size;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  const CIrcularIcon({
    super.key,
    required this.dark,
    this.width,
    this.height,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
    this.size = TSizes.lg,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor != null
              ? backgroundColor!
              : dark
                  ? TColors.black.withOpacity(0.9)
                  : TColors.white.withOpacity(0.9)),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          size: size,
          icon,
          color: color,
        ),
      ),
    );
  }
}

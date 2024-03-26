import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color backgroundColor, borderColor;
  final BoxShadow boxShadow;
  final Widget? child;
  final bool showBorder;

  const TRoundedContainer({
    Key? key,
    this.showBorder = false,
    this.width,
    this.height,
    this.borderRadius = TSizes.cardRadiusLg,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.color = Colors.transparent,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.boxShadow = const BoxShadow(
      color: Colors.black54,
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        // boxShadow: [boxShadow],
        // back: showBackground
        //     ? dark
        //         ? TColors.dark
        //         : TColors.light
        //     : Colors.transparent,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}

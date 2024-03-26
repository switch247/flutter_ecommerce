import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
    this.rating = '5.0',
    this.raters = '400',
  });
  final String rating, raters;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: rating + ' ',
                  style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(text: '(' + raters + ')')
            ]))
          ],
        ),
        IconButton(
            icon: Icon(
              Icons.share,
              size: TSizes.iconMd,
            ),
            onPressed: () {})
      ],
    );
  }
}

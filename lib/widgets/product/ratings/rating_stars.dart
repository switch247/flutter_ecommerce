import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class TRatingBarIndicator extends StatelessWidget {
  TRatingBarIndicator({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        itemCount: 6,
        rating: 4.5,
        itemSize: 20,
        itemBuilder: (_, __) => Icon(
              Iconsax.star1,
              color: TColors.primary,
            ));
  }
}

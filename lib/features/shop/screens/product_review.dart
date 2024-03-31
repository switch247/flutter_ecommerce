import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/product/ratings/overall_rating.dart';
import '../../../widgets/product/ratings/rating_stars.dart';
import '../../../widgets/product/ratings/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Reviews and Rattings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Ratings and reviews are from people who use the same produc as you do'),
              const SizedBox(height: TSizes.spaceBtwItems),
              // overall rating
              TOverallProductRating(),

              TRatingBarIndicator(rating: 4.5),

              Text('12,45', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwItems),
              // user review List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

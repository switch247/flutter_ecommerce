import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/container/rounded_container.dart';

import '../../utils/constants/sizes.dart';

class SingleAddressCard extends StatelessWidget {
  SingleAddressCard({
    super.key,
    this.selectedAddress = false,
  });
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      width: double.infinity,
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      showBorder: true,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? TColors.darkerGrey
              : TColors.grey,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(children: [
        Positioned(
          right: 5,
          top: 0,
          child: Icon(
            selectedAddress ? Iconsax.tick_circle5 : null,
            color: dark ? TColors.light : TColors.dark.withOpacity(0.6),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mr. Chala',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: TSizes.sm / 2,
            ),
            Row(
              children: [
                Icon(Iconsax.mobile),
                const SizedBox(width: TSizes.sm / 2),
                Text(
                  'Phone Number',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            // Row(
            //   children: [
            //     const SizedBox(
            //   height: TSizes.sm / 2,
            // ),
            // Icon(Iconsax.location),
            //   ],
            // ),

            const SizedBox(width: TSizes.sm / 2),
            Text('23425, adress x , subadlocation, other location, ethiopia',
                overflow: TextOverflow.visible, softWrap: true),
          ],
        )
      ]),
    );
  }
}

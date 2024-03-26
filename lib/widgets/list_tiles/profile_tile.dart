import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile(
      {super.key,
      required this.dark,
      this.image = TImages.productImage22,
      this.title = 'User Name',
      this.subTitle = 'User Detail',
      this.icon = Iconsax.edit,
      this.color = TColors.white,
      required this.onPressed});

  final bool dark;
  final String image, title, subTitle;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        dark: dark,
        image: image,
        width: 50,
        height: 50,
        fit: BoxFit.contain,
        // padding: 0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
          )),
    );
  }
}

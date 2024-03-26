import 'package:flutter/material.dart';

import '../../utils/constants/image_strings.dart';
import '../images/image_text_widget.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TVerticalImageText(
              image: TImages.shoeIcon,
            );
          }),
    );
  }
}

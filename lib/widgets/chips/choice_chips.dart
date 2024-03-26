import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/widgets/container/circular_container.dart';

import '../../utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    this.selected = true,
    this.onSelected,
    this.backgroundColor = TColors.darkGrey,
  });
  final String text;
  final Color backgroundColor;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    final dark = THelperFunctions.isDarkMode(context);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        
          // padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          padding: EdgeInsets.all(0),
          labelPadding: isColor ? EdgeInsets.all(0) : EdgeInsets.all(5),
          selectedColor: TColors.primary,
          disabledColor:
              dark ? TColors.darkGrey.withOpacity(0.4) : TColors.darkGrey,
          shape: isColor ? CircleBorder() : null,
          avatar: isColor
              ? TCircularContainer(
                  width: 50,
                  height: 50,
                  backgroundColor: THelperFunctions.getColor(text)!,
                )
              : null,
          label: isColor ? const SizedBox() : Text(text),
          selected: selected,
          onSelected: onSelected,
          labelStyle: TextStyle(color: dark ? TColors.white : TColors.black)),
    );
  }
}

import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../container/circular_container.dart';
import 'curved_edge_widget.dart';

class TPrimaryHeaderWidget extends StatelessWidget {
  const TPrimaryHeaderWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        padding: const EdgeInsets.all(0),
        color: TColors.primary,
        child: SizedBox(
          // height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

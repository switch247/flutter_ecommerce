import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../widgets/loaders/animation_loader.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: null,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(
                text: text,
                animations: animation,
              )
            ],
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    // print('end');
    Navigator.of(Get.overlayContext!).pop();
  }
}
